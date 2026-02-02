import 'package:my_simple_crud/domain/entities/post_item.dart';
import 'package:my_simple_crud/domain/mappers/post_item_mapper.dart';

import '../../domain/params/post_params.dart';
import '../models/post_item_model.dart';
import 'datasource.dart';

import 'package:dio/dio.dart';

class DataSourceImpl implements Datasource {
  final Dio _dio;

  DataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<PostItem>> fetchPosts() async {
    try {
      final responseJson = await _dio.get('/posts');

      final model =
          responseJson.data.map<PostItemModel>((item) {
                return PostItemModel.fromJson(item as Map<String, dynamic>);
              }).toList()
              as List<PostItemModel>;

      return PostItemModelMapper.toEntityList(model);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostItem> createPost(PostParams params) async {
    try {
      final body = {
        'title': params.title,
        'body': params.body,
        'userId': params.userId,
      };
      final response = await _dio.post('/posts', data: body);

      final post = PostItemModel.fromJson(response.data);
      return PostItemModelMapper.toEntity(post);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostItem> updatePost(PostParams params, int id) async {
    try {
      final body = {
        'title': params.title,
        'body': params.body,
        'userId': params.userId,
      };
      final response = await _dio.put('/posts/$id', data: body);

      final post = PostItemModel.fromJson(response.data);
      return PostItemModelMapper.toEntity(post);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deletePost(int postId) async {
    try {
      final response = await _dio.delete('/posts/$postId');
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}
