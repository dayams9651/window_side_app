import 'package:flutter/foundation.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import '../controller/text_receiver_controller.dart';
import 'package:get/get.dart';

class Server {
  final TextReceiverController controller = Get.find();
  Future<void> startServer(String ip, int port) async {
    final router = Router();
    router.post('/send-text', (shelf.Request request) async {
      final body = await request.readAsString();
      final data = Uri.splitQueryString(body);
      final imei = data['imei'] ?? '';
      final serial = data['serial'] ?? '';
      final macAdd = data['macAdd'] ?? '';
      final combined = 'IMEI: $imei\nSERIAL: $serial\nMAC Address: $macAdd';
      controller.updateText(combined);
      return shelf.Response.ok('Received');
    });

    final handler = const shelf.Pipeline()
        .addMiddleware(shelf.logRequests())
        .addHandler(router);

    await io.serve(handler, ip, port);
    debugPrint('Server running at http://$ip:$port');
  }
}
