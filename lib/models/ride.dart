import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Ride {
  final String? image;
  final String type;
  final num rate;
  final num? eta;

  const Ride({
    this.image,
    required this.type,
    required this.rate,
    this.eta,
  });
}
