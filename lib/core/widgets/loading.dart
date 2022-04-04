import 'package:flutter/material.dart';
import 'package:pokebag_mobile/core/cosmetics/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppSkeletonLoading extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;

  const AppSkeletonLoading({
    this.height = 30,
    this.width = double.infinity,
    this.radius,
  });

  const AppSkeletonLoading.blogBanner([
    double width = double.infinity,
    double height = 300,
    double radius = 0,
  ])  : height = height,
        width = width,
        radius = radius;

  const AppSkeletonLoading.tab([
    this.width = 120,
    this.height = 30,
    this.radius = 8,
  ]);

  const AppSkeletonLoading.blog([
    double width = double.infinity,
    double height = 100,
    double radius = 0,
  ])  : height = height,
        width = width,
        radius = radius;

  const AppSkeletonLoading.smallText([
    double width = 100,
    double height = 16,
    double? radius,
  ])  : height = height,
        width = width,
        radius = radius;

  const AppSkeletonLoading.widthText([
    double height = 16,
    double width = double.infinity,
    double? radius,
  ])  : height = height,
        width = width,
        radius = radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral.shade200,
      highlightColor: AppColors.neutral.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? height / 5),
          color: AppColors.neutral,
        ),
      ),
    );
  }
}
