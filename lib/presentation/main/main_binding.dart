import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    final dio = Dio(baseOptions());
    Get.put<Dio>(dio, permanent: true);
  }

  static BaseOptions baseOptions({String? baseUrl, int? timeOut}) {
    return BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: <String, dynamic>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 5),
    );
  }
}
