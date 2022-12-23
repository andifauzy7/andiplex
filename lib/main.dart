import 'package:andiplex/core/injection/injection.dart';
import 'package:andiplex/features/movies_info/presentation/main/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().initialize();
  runApp(
    const GetMaterialApp(
      home: MainPage(),
    ),
  );
}
