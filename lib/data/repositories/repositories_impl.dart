import 'package:my_simple_crud/data/datasources/datasource.dart';
import 'package:my_simple_crud/data/repositories/repositories.dart';
import 'package:my_simple_crud/domain/entities/post_item.dart';
import 'package:my_simple_crud/domain/params/post_params.dart';

class RepositoriesImpl implements Repositories {
  final Datasource _datasource;
  RepositoriesImpl({required Datasource datasource}) : _datasource = datasource;
  @override
  Future<List<PostItem>> getPosts() async {
    final list = await _datasource.fetchPosts();
    return list;
  }

  @override
  Future<PostItem> createPost(PostParams params) async {
    final post = await _datasource.createPost(params);
    return post;
  }

  @override
  Future<bool> deletePost(int postId) async {
    final result = await _datasource.deletePost(postId);
    return result;
  }

  @override
  Future<PostItem> updatePost(PostParams params, int id) async {
    final post = await _datasource.updatePost(params, id);
    return post;
  }
}
