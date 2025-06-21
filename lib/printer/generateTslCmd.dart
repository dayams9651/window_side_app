String generateTsplCommand(String serial, String imei) {
  return '''
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
}
