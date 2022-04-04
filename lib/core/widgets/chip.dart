import 'package:flutter/material.dart';
import 'package:pokebag_mobile/core/cosmetics/colors.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';
import 'package:pokebag_mobile/core/widgets/spacer.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? icon;
  final Widget? prefixIcon;

  /// Default text style for unselected chip
  final TextStyle textStyle;

  /// Selected chip will use this textstyle
  final TextStyle selectedTextStyle;

  /// Force button disabled
  final bool isDisabled;

  /// If [withRemoveIcon] is [True]
  /// Selected chip color will not changed
  /// And will have a remove icon trailing
  final bool withRemoveIcon;

  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  final bool outline;

  final Color? backgroundColor;

  const AppFilterChip({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.icon,
    this.prefixIcon,
    this.textStyle = AppRegularText.body2,
    this.selectedTextStyle = AppMediumText.body2,
    this.borderRadius = 26,
    this.horizontalPadding = AppSpacing.medium,
    this.isDisabled = false,
    this.withRemoveIcon = false,
    this.verticalPadding = 8,
    this.outline = false,
    this.backgroundColor,
  }) : super(key: key);

  const AppFilterChip.small({
    required this.label,
    required this.isSelected,
    this.onTap,
    this.icon,
    this.prefixIcon,
    this.textStyle = AppRegularText.caption1,
    this.selectedTextStyle = AppMediumText.caption1,
    this.borderRadius = 26,
    this.horizontalPadding = AppSpacing.medium,
    this.isDisabled = false,
    this.withRemoveIcon = false,
    this.verticalPadding = 7,
    this.outline = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final changeToActiveColor = isSelected && !withRemoveIcon;
    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          color: changeToActiveColor
              ? backgroundColor
              : backgroundColor ?? AppColors.neutral.shade100,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
              color: outline && !isSelected
                  ? AppColors.neutral.shade700
                  : AppColors.light,
              width: 1)
          // : null
          ,
        ),
        child: (icon == null && prefixIcon == null && !withRemoveIcon)
            ? Text(
                label,
                style: changeToActiveColor
                    ? selectedTextStyle.light
                    : textStyle.neutral70,
                textAlign: TextAlign.center,
              )
            : Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                // : MainAxisSize.min,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  if (prefixIcon != null) const AppSizedBox.widthSmall(),
                  Text(
                    label,
                    style: changeToActiveColor
                        ? selectedTextStyle.light
                        : textStyle.neutral70,
                  ),
                  if (icon != null || withRemoveIcon)
                    const AppSizedBox.widthSmall(),
                  if (icon != null) icon!,
                  if (withRemoveIcon && isSelected)
                    Icon(
                      Icons.close,
                      color: AppColors.neutral.shade400,
                      size: 16,
                    )
                ],
              ),
      ),
    );
  }
}
