import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/datasource.dart';
import '../data/datasources/datasource_impl.dart';
import '../data/repositories/repositories.dart';
import '../data/repositories/repositories_impl.dart';
import '../presentation/home/cubit/home_cubit.dart';

final services = GetIt.instance;

Future<void> init() async {
  services.registerFactory(() => HomeCubit(repositories: services()));

  services.registerLazySingleton(() {
    final options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: <String, dynamic>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
    );
    return Dio(options);
  });

  services.registerLazySingleton<Datasource>(
    () => DataSourceImpl(dio: services()),
  );

  services.registerLazySingleton<Repositories>(
    () => RepositoriesImpl(datasource: services()),
  );
}
