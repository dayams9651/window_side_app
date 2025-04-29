import 'package:get/get.dart';

class TextReceiverController extends GetxController {
  var receivedText = ''.obs;

  void updateText(String newText) {
    receivedText.value = newText;
  }
}
