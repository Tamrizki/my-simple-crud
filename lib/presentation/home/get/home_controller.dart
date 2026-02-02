import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_simple_crud/data/repositories/repositories.dart';

import '../../../domain/entities/post_item.dart';
import '../../../domain/params/post_params.dart';

class HomeController extends GetxController {
  final Repositories _repositories;
  HomeController({required Repositories repositories})
    : _repositories = repositories;

  var postList = <PostItem>[].obs;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  void addData(PostItem post) {
    postList.add(post);
  }

  void updateData(PostItem post, int id) {
    final index = postList.indexWhere((p) => p.id == id);
    if (index != -1) {
      postList[index] = post;
    }
    postList.refresh();
  }

  void deleteData(int postId) {
    postList.removeWhere((post) => post.id == postId);
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    await _handleRequest(() async {
      final posts = await _repositories.getPosts();
      postList.addAll(posts);
      debugPrint('Fetched posts: $posts');
    }, 'fetching posts');
  }

  Future<void> createPost(PostParams data) async {
    await _handleRequest(() async {
      final post = await _repositories.createPost(data);
      addData(post);
      debugPrint('Created post: $post');
    }, 'creating post');
  }

  Future<void> updatePost(int id, PostParams data) async {
    await _handleRequest(() async {
      final post = await _repositories.updatePost(data, id);
      updateData(post, id);
      debugPrint('Updated post: $post');
    }, 'updating post');
  }

  Future<void> deletePost(int id) async {
    await _handleRequest(() async {
      final success = await _repositories.deletePost(id);
      deleteData(id);
      debugPrint('Deleted post with id $id: $success');
    }, 'deleting post');
  }

  Future<void> _handleRequest(
    Future<void> Function() request,
    String operation,
  ) async {
    _isLoading.value = true;
    try {
      await request();
    } catch (e) {
      final message = _getErrorMessage(e, operation);
      debugPrint(message);
      showError(message);
    } finally {
      _isLoading.value = false;
    }
  }

  String _getErrorMessage(dynamic e, String operation) {
    String message = 'Error during $operation: $e';
    if (e is DioException) {
      message = e.message ?? 'Unknown error';
    }
    return message;
  }

  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
