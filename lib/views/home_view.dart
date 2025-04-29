import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/text_receiver_controller.dart';
import '../server/server.dart'; // 🔥 Also import server

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextReceiverController controller = Get.put(TextReceiverController()); // ✅ Correct

  final Server server = Server(); // ✅ Start server inside app

  @override
  Widget build(BuildContext context) {
    server.startServer(); // ✅ Server start karte hi

    return Scaffold(
      appBar: AppBar(title: const Text('Desktop Receiver')),
      body: Center(
        child: Obx(() => Text(
          controller.receivedText.value.isEmpty
              ? 'Waiting for text...'
              : controller.receivedText.value,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
