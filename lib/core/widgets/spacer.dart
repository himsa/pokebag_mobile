import 'package:flutter/material.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';

class AppSizedBox extends SizedBox {
  const AppSizedBox.textSpacing([double height = 4]) : super(height: height);
  const AppSizedBox.heightXxl([double height = AppSpacing.xxl])
      : super(height: height);
  const AppSizedBox.heightXl([double height = AppSpacing.xl])
      : super(height: height);
  const AppSizedBox.height([double height = AppSpacing.main])
      : super(height: height);
  const AppSizedBox.heightMedium([double height = AppSpacing.medium])
      : super(height: height);
  const AppSizedBox.heightSmall() : super(height: AppSpacing.small);
  const AppSizedBox.heightxs() : super(height: AppSpacing.xs);
  const AppSizedBox.widthXl([double width = AppSpacing.xl])
      : super(width: width);
  const AppSizedBox.width([double width = AppSpacing.main])
      : super(width: width);
  const AppSizedBox.widthMedium([double width = AppSpacing.medium])
      : super(width: width);
  const AppSizedBox.widthSmall() : super(width: AppSpacing.small);
  const AppSizedBox.widthxs() : super(width: AppSpacing.xs);
}
