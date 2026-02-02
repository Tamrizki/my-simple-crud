import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_simple_crud/data/datasources/datasource.dart';
import 'package:my_simple_crud/data/repositories/repositories_impl.dart';
import 'package:my_simple_crud/presentation/home/get/home_controller.dart';

import '../../../data/datasources/datasource_impl.dart';
import '../../../data/repositories/repositories.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<Datasource>(DataSourceImpl(dio: Get.find<Dio>()));
    Get.put<Repositories>(RepositoriesImpl(datasource: Get.find<Datasource>()));
    Get.put<HomeController>(
      HomeController(repositories: Get.find<Repositories>()),
    );
  }
}
