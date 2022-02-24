import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  bool disableMorphicEffect;
  GlassContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      this.disableMorphicEffect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return disableMorphicEffect
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: child,
          )
        : GlassmorphicContainer(
            width: width,
            height: height,
            borderRadius: 20,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            border: 2,
            blur: 18,
            child: child,
          );
  }
}
