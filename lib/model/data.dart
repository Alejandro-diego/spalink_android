class DatosAD {
  int temp;
  int tempSetting;
  bool fill;
  bool leds;
  bool valve;
  bool pump;
  bool buble;
  bool warm;
  String disp;
  String email;
  String name;

  DatosAD(
      {required this.fill,
      required this.temp,
      required this.name,
      required this.email,
      required this.warm,
      required this.tempSetting,
      required this.pump,
      required this.leds,
      required this.buble,
      required this.disp,
      required this.valve});

  factory DatosAD.fromRTDB(Map<String, dynamic> data) {
    return DatosAD(
        fill: data['fill'] ?? false,
        warm: data['warm'] ?? false,
        temp: data['temp'] ?? 2151,
        tempSetting: data['setTemp'] ?? 23,
        pump: data['pump'] ?? false,
        buble: data['buble'] ?? false,
        leds: data['leds'] ?? false,
        valve: data['valve'] ?? false,
        name: data['name'] ?? 'name',
        email: data['email'] ?? 'email',
        disp: data['disp'] ?? '1001');
  }
}
