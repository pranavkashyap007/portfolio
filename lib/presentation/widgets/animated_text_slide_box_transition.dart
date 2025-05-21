import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'animated_slide_box.dart';

class AnimatedTextSlideBoxTransition extends StatefulWidget {
  const AnimatedTextSlideBoxTransition({
    Key? key,
    required this.controller,
    required this.text,
    required this.textStyle,
    this.width = double.infinity,
    this.maxLines = 1,
    this.widthFactor = 1,
    this.heightFactor = 1,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.position,
    this.textAlign,
    this.boxColor = Colors.transparent,
    this.coverColor = Colors.transparent,
    this.visibleAnimationCurve = Curves.easeInOut,
    this.invisibleAnimationCurve = Curves.easeInOut,
    this.slideAnimationCurve = Curves.easeInOut,
  }) : super(key: key);

  final AnimationController controller;
  final double heightFactor;
  final double widthFactor;
  final Color boxColor;
  final Color coverColor;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;
  final Animation<Offset>? position;
  final Curve visibleAnimationCurve;
  final Curve invisibleAnimationCurve;
  final Curve slideAnimationCurve;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double width;
  final int maxLines;

  @override
  _AnimatedTextSlideBoxTransitionState createState() =>
      _AnimatedTextSlideBoxTransitionState();
}

class _AnimatedTextSlideBoxTransitionState
    extends State<AnimatedTextSlideBoxTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> visibleAnimation;
  late Animation<double> invisibleAnimation;
  late Animation<RelativeRect> textPositionAnimation;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    setTextWidthAndHeight();
    controller = widget.controller;

    visibleAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(parent: controller, curve: widget.visibleAnimationCurve),
    );

    invisibleAnimation = Tween<double>(begin: textWidth, end: 0).animate(
      CurvedAnimation(
          parent: controller, curve: widget.invisibleAnimationCurve),
    );

    textPositionAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, textHeight, 0, 0),
      end: RelativeRect.fromLTRB(0, 0, 0, 0),
    ).animate(
        CurvedAnimation(parent: controller, curve: widget.slideAnimationCurve));

    super.initState();
  }

  void setTextWidthAndHeight() {
    size = widget.text.textSize(
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );
    textWidth = size.width * widget.widthFactor;
    textHeight = size.height * widget.heightFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSlideBox(
          controller: widget.controller,
          height: textHeight,
          width: textWidth,
          coverColor: widget.coverColor,
          boxColor: widget.boxColor,
          visibleBoxAnimation: visibleAnimation,
          invisibleBoxAnimation: invisibleAnimation,
        ),
        PositionedTransition(
          rect: textPositionAnimation,
          child: Text(
            widget.text,
            style: widget.textStyle,
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
          ),
        ),
      ],
    );
  }
}
