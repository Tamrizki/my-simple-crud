import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../domain/entities/post_item.dart';
import '../../../../domain/params/post_params.dart';
import '../../../consts/status.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repositories _repositories;

  HomeCubit({required Repositories repositories})
    : _repositories = repositories,
      super(const HomeState());

  Future<void> fetchPosts() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final posts = await _repositories.getPosts();
      emit(state.copyWith(status: Status.success, posts: posts));
      debugPrint('Fetched posts: $posts');
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: _getErrorMessage(e, 'fetching posts'),
        ),
      );
    }
  }

  Future<void> createPost(PostParams data) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final post = await _repositories.createPost(data);
      final updatedPosts = List<PostItem>.from(state.posts)..add(post);
      emit(state.copyWith(status: Status.success, posts: updatedPosts));
      debugPrint('Created post: $post');
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: _getErrorMessage(e, 'creating post'),
        ),
      );
    }
  }

  Future<void> updatePost(int id, PostParams data) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final post = await _repositories.updatePost(data, id);
      final updatedPosts = state.posts
          .map((p) => p.id == id ? post : p)
          .toList();
      emit(state.copyWith(status: Status.success, posts: updatedPosts));
      debugPrint('Updated post: $post');
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: _getErrorMessage(e, 'updating post'),
        ),
      );
    }
  }

  Future<void> deletePost(int id) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final success = await _repositories.deletePost(id);
      if (success) {
        final updatedPosts = List<PostItem>.from(state.posts)
          ..removeWhere((p) => p.id == id);
        emit(state.copyWith(status: Status.success, posts: updatedPosts));
      } else {
        emit(state.copyWith(status: Status.success));
      }
      debugPrint('Deleted post with id $id: $success');
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: _getErrorMessage(e, 'deleting post'),
        ),
      );
    }
  }

  String _getErrorMessage(dynamic e, String operation) {
    String message = 'Error during $operation: $e';
    if (e is DioException) {
      message = e.message ?? 'Unknown error';
    }
    return message;
  }
}
