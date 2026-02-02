import 'package:get/get.dart';
import 'package:my_simple_crud/presentation/home/get/home_binding.dart';
import 'package:my_simple_crud/presentation/home/page/home_page.dart';

class Pages {
  static final initailRoutes = HomePage.routeName;
  static final routes = [
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
