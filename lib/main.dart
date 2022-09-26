import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    ),
  );
}
