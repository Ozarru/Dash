import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Route {
  final String name;
  final num rate;
  final num? etd;
  final num? eta;

  const Route({
    required this.name,
    required this.rate,
    this.etd,
    this.eta,
  });
}
