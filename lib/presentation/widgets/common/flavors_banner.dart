import 'package:fire_chat/config/flavors.dart';
import 'package:flutter/material.dart';

class FlavorsBanner extends StatelessWidget {
  const FlavorsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.greenAccent,
    );
  }
}
