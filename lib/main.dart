import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean_arch/core/theme.dart';

import 'core/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      theme: baseTheme,
    ),
  );
}
