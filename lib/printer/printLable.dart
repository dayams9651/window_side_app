// import 'package:desktop_code/printer/generateTslCmd.dart';
//
// void printLabel(String serial, String imei) async {
//   String tsplCommand = generateTsplCommand(serial, imei);
//   // await bluetoothPrint.printLabel({
//   //   'data': tsplCommand,
//   // });
// }


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

Future<void> printToTscPrinter(String serial, String imei) async {
  final tspl = '''
SIZE 37.2 mm,12.2 mm
GAP 2 mm,0 mm
DENSITY 8
SPEED 4
DIRECTION 1
REFERENCE 0,0
CLS
TEXT 10,10,"0",0,1,1,"SN: $serial"
TEXT 10,40,"0",0,1,1,"IMEI: $imei"
PRINT 1,1
''';

  final directory = await getTemporaryDirectory();
  final file = File('C:\\Users\\mscor\\Desktop\\Print\\print.txt');
  await file.writeAsString(tspl);

  Process.run('cmd', ['/c', 'copy "${file.path}" \\\\.\\USB001']).then((result) {
    if (result.exitCode == 0) {
      debugPrint("Print command sent successfully.");
    } else {
      debugPrint("Error: ${result.stderr}");
    }
  });
}








