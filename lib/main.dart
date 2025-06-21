import 'dart:io';
import 'package:desktop_code/views/home_view.dart';
import 'package:desktop_code/views/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:desktop_code/controller/text_receiver_controller.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.setMinimumSize(const Size(1050, 550));
    await windowManager.setMaximumSize(const Size(1100, 600));
  }
  Get.put(TextReceiverController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'P12 Devices',
      home: ScreenUtilInit(child: SignupScreen()),
    );
  }
}


