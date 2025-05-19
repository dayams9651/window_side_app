import 'package:get/get.dart';

class TextReceiverController extends GetxController {
  var imei = ''.obs;
  var serial = ''.obs;
  var macAdd = ''.obs;

  void updateText(String text) {
    final lines = text.split('\n');
    for (var line in lines) {
      if (line.startsWith('IMEI:')) {
        imei.value = line.replaceFirst('IMEI:', '').trim();
      } else if (line.startsWith('SERIAL:')) {
        serial.value = line.replaceFirst('SERIAL:', '').trim();
      } else if (line.startsWith('MACADD:')) {
        macAdd.value = line.replaceFirst('MACADD:', '').trim();
      }
    }
  }
}

