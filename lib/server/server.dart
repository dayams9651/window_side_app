import 'package:shelf/shelf.dart' as shelf; // ✅ Alias lagaya
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import '../controller/text_receiver_controller.dart';
import 'package:get/get.dart';

class Server {
  final TextReceiverController controller = Get.find();

  void startServer() async {
    final router = Router();

    router.post('/send-text', (shelf.Request request) async {
      final body = await request.readAsString();
      final text = Uri.splitQueryString(body)['text'] ?? 'No Text';

      controller.updateText(text);

      return shelf.Response.ok('Text received'); // ✅ shelf.Response use karo
    });

    final handler = const shelf.Pipeline()
        .addMiddleware(shelf.logRequests())
        .addHandler(router);

    await io.serve(handler, '192.168.68.104', 5000);
    print('Server running on http://192.168.68.104:5000');
  }
}
