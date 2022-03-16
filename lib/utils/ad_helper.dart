import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // test id
      // return 'ca-app-pub-6361427235342992/8538954786';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6361427235342992/4642752432';
    }
    throw new UnsupportedError("Unsupported platform");
  }
}
