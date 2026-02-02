import '../../domain/entities/post_item.dart';
import '../../domain/params/post_params.dart';

abstract class Repositories {
  Future<List<PostItem>> getPosts();
  Future<PostItem> createPost(PostParams params);
  Future<PostItem> updatePost(PostParams params, int id);
  Future<bool> deletePost(int postId);
}
