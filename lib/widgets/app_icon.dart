import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/utils/dimention.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconcolor;
  final double size;
  final double iconSize;
  AppIcon({Key? key,
    required this.icon,
    this.backgroundcolor = const Color( 0xFFfcf4e4),
    this.iconcolor = const Color(0xFF756d54),
    this.size = 40,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size/2),
          color: backgroundcolor
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconSize,
      ),
    );

  }
}