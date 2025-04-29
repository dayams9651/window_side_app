import 'package:desktop_code/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desktop_code/controller/text_receiver_controller.dart';
import 'package:desktop_code/server/server.dart';

void main() {
  Get.put(TextReceiverController());

  Server().startServer();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desktop Receiver',
      home: HomeView(),
    );
  }
}
