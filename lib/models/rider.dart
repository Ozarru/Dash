import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Rider {
  final String name;
  final num rate;
  final num? radius;
  final num? eta;

  const Rider({
    required this.name,
    required this.rate,
    this.radius,
    this.eta,
  });
}
