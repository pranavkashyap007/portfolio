import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/views/about/widgets/left_stick_label.dart';
import 'package:portfolio_flutter/presentation/views/about/widgets/specialization_text.dart';

import '../../../configs/configs.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({
    super.key,
  });
  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> with TickerProviderStateMixin {
  AnimationController? _textController;
  AnimationController? _earthController;
  AnimationController? _galaxyController;
  AnimationController? _stickController;
  Image myPicture = Image.asset(kaShowcaseStyle);

  @override
  void initState() {
    super.initState();
    _precacheImage();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
    _textController = AnimationController(
      vsync: this,
      duration: duration2000,
    )..forward();
    _earthController = AnimationController(
      vsync: this,
      duration: duration2870,
    )..repeat(
        reverse: true,
      );
  }

  void _precacheImage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(myPicture.image, context);
    });
  }

  @override
  void dispose() {
    if (_textController != null) {
      _textController!
        ..stop()
        ..dispose();
    }
    if (_earthController != null) {
      _earthController!
        ..stop()
        ..dispose();
    }
    if (_galaxyController != null) {
      _galaxyController!
        ..stop()
        ..dispose();
    }
    if (_stickController != null) {
      _stickController!
        ..stop()
        ..dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.adaptive(
      mobileVersion(),
      desktopVersion(),
      md: desktopVersion(),
    );
  }

  Widget mobileVersion() {
    return <Widget>[
      Positioned(
        bottom: s0,
        left: s0,
        child: LeftStickLabel(
          textController: _textController!,
          stickController: _stickController!,
        ),
      ),
      Positioned(
        top: s0,
        left: s0,
        right: s0,
        child: Container(
          margin: context.symmetricPercentPadding(hPercent: s8),
          padding: context.percentPadding(t: s10, l: s5, r: s5, b: s5),
          child: const SpecializationText(),
        ),
      ),
      Positioned(
        bottom: s0,
        left: s0,
        right: s0,
        child: <Widget>[
          Positioned(
            bottom: s0,
            left: s0,
            right: s0,
            child: AspectRatio(
              aspectRatio: 12 / 9,
              child: Image(
                image: myPicture.image,
              ),
            ),
          ),
        ]
            .addStack()
            .addSizedBox(
              width: context.screenWidth,
              height: context.percentHeight(s50),
            )
            .addPadding(
              edgeInsets: context.percentPadding(
                r: s6,
              ),
            ),
      ),
    ]
        .addStack(
          alignment: Alignment.centerLeft,
        )
        .addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight -
              Theme.of(context).appBarTheme.toolbarHeight!,
        );
  }

  Widget desktopVersion() {
    return <Widget>[
      Positioned(
        bottom: s0,
        left: s0,
        child: LeftStickLabel(
          textController: _textController!,
          stickController: _stickController!,
        ),
      ),
      Container(
        margin: context.symmetricPercentPadding(hPercent: s8),
        padding: context.allPercentPadding(allPercent: s3),
        child: <Widget>[
          const SpecializationText().addCenter().addExpanded(),
          const SizedBox.shrink().addExpanded(),
        ].addRow(),
      ),
      <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: myPicture.image,
            height: context.percentHeight(s70),
          ),
        ),
      ]
          .addStack(
            alignment: Alignment.center,
          )
          .addPadding(
              edgeInsets: context.percentPadding(
            r: s6,
          ))
          .addAlign(
            alignment: Alignment.centerRight,
          ),
    ]
        .addStack(
          alignment: Alignment.centerLeft,
        )
        .addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight -
              Theme.of(context).appBarTheme.toolbarHeight!,
        );
  }
}
