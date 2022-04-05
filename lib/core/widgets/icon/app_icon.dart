import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.assetPath, {
    Key? key,
    this.size = 24,
    this.color,
  }) : super(key: key);

  final String assetPath;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    Widget svgIcon = SvgPicture.asset(
      assetPath,
      semanticsLabel: assetPath,
      color: color,
    );
    return SizedBox(
      height: size,
      width: size,
      child: svgIcon,
    );
  }
}
