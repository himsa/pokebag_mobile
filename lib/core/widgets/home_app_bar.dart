import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeAppBar extends StatelessWidget {
  final Function? onPressedDarkMode;
  final int? initialIConIndex;
  HomeAppBar({Key? key, this.onPressedDarkMode, this.initialIConIndex});

  @override
  Widget build(BuildContext context) {
    return [
      'Home'.text.headline6(context).make(),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedIconButton(
            onPressed: onPressedDarkMode,
            duration: const Duration(milliseconds: 500),
            splashColor: Colors.transparent,
            initialIcon: initialIConIndex ?? 0,
            size: 24,
            icons: const <AnimatedIconItem>[
              AnimatedIconItem(
                icon: Icon(Icons.dark_mode_rounded, color: Vx.amber300),
              ),
              AnimatedIconItem(
                icon: Icon(Icons.light_mode_rounded, color: Vx.teal600),
              ),
            ],
          ),
          Icon(Icons.notifications).onTap(() {}),
        ],
      ),
    ].hStack(alignment: MainAxisAlignment.spaceBetween).px12();
  }
}
