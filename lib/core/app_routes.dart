import 'package:get/route_manager.dart';

import '../features/pokemon/presentation/bindings/home_binding.dart';
import '../features/pokemon/presentation/pages/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
