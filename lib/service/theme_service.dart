import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  get primaryColor => _box.read("primaryColor") == null
      ? Color(0xFF2a5abe)
      : Color(_box.read("primaryColor"));
  get cardColor => _box.read("cardColor") == null
      ? Color(0xFFDEEDCE)
      : Color(_box.read("cardColor"));
  get bodyText1 => _box.read("bodytext1") == null
      ? Colors.white
      : Color(_box.read("bodytext1"));
  get bodyText2 => _box.read("bodytext2") == null
      ? Colors.black
      : Color(_box.read("bodytext2"));
}
