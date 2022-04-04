import 'package:flutter/material.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';

import 'loading.dart';

class ShimmerListLoadingWidget extends StatelessWidget {
  const ShimmerListLoadingWidget({
    Key? key,
    this.height = 120,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.paddingAllMain,
      children: [1, 2, 3, 4]
          .map(
            (e) => Container(
              margin: EdgeInsets.only(
                bottom: AppSpacing.medium,
              ),
              child: AppSkeletonLoading(
                height: height,
                width: double.infinity,
                radius: 4,
              ),
            ),
          )
          .toList(),
    );
  }
}
