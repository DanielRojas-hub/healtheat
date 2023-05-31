import 'package:flutter/material.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  MyHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
    this.height,
    this.backgroundColor,
    this.borderRadius,
  });

  final Widget child;
  final double maxHeight;
  final double minHeight;

  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: height ?? minHeight,
      decoration:
          BoxDecoration(color: backgroundColor, borderRadius: borderRadius),
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
