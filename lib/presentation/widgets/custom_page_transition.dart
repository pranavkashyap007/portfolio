import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/configs/configs.dart';
//import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';

class CustomPageTransition extends AnimatedWidget {
  // Existing constructor and properties remain unchanged
  const CustomPageTransition({
    Key? key,
    required this.startController,
    this.index = 0,
    required this.height,
    required this.width,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.boxColor = kBlack,
    this.coverColor = kWhite,
    required this.slideInterval,
    this.visibleBoxCurve = Curves.easeInOut,
    this.invisibleBoxCurve = Curves.easeInOut,
  }) : super(key: key, listenable: startController);

  // Existing properties remain the same
  final AnimationController startController;
  final double height;
  final int index;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Curve visibleBoxCurve;
  final Curve invisibleBoxCurve;
  final Interval slideInterval;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;

  // Modified animation getters for slide effect
  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(begin: height, end: 0).animate(
        CurvedAnimation(
          parent: startController,
          curve: Interval(
            slideInterval.begin,
            slideInterval.end,
            curve: visibleBoxCurve,
          ),
        ),
      );

  Animation<double> get invisibleAnimation =>
      invisibleBoxAnimation ??
      Tween<double>(begin: -height, end: 0).animate(
        CurvedAnimation(
          parent: startController,
          curve: Interval(
            slideInterval.end,
            1,
            curve: invisibleBoxCurve,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Sliding up element
          Transform.translate(
            offset: Offset(0, visibleAnimation.value),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: boxColor,
                border: const Border(),
              ),
            ),
          ),
          // Sliding down element
          Transform.translate(
            offset: Offset(0, invisibleAnimation.value),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: coverColor,
                border: Border.all(
                  color: coverColor,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
