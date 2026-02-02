import 'package:my_simple_crud/domain/params/post_params.dart';

import '../../domain/entities/post_item.dart';

abstract class Datasource {
  Future<List<PostItem>> fetchPosts();
  Future<PostItem> createPost(PostParams params);
  Future<PostItem> updatePost(PostParams params, int id);
  Future<bool> deletePost(int postId);
}
