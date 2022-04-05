import 'package:flutter/material.dart';
import 'package:pokebag_mobile/core/cosmetics/colors.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';

extension AppWidgetUtils on Widget {
  Container bottomSheetWrapper() => Container(
        decoration: const BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        padding: AppSpacing.paddingAllMain,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            this,
          ],
        ),
      );
}
