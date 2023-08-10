import 'package:flutter/material.dart';
import 'package:share_trip/constants/color_constants.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? color;
  const AppContainer({
    super.key,
    required this.child,
    this.borderRadius = 8,
      this.decoration,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: width,
      height: height,
      decoration:decoration??
        BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
      child: child,
    );
  }
}
