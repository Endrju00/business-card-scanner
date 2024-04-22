import 'package:flutter/material.dart';

class BcsContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final Widget? child;
  final Color color;

  const BcsContainer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = BorderRadius.zero,
    this.color = const Color(0xFF3F37C9),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius,
            ),
          ),
          Positioned(
            top: height / 12,
            left: width / 12,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
