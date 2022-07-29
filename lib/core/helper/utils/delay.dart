import 'package:flutter/foundation.dart';
import 'dart:async';

class Delay {
  final int milliseconds;
  late VoidCallback action;
  Timer? _timer;

  Delay({this.milliseconds = 900});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
