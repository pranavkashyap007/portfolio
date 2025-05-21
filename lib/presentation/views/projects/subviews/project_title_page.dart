import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class ProjectTitlePage extends StatefulWidget {
  const ProjectTitlePage({super.key});

  @override
  State<ProjectTitlePage> createState() => _ProjectTitlePageState();
}

class _ProjectTitlePageState extends State<ProjectTitlePage>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _stickController;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration2000)
      ..forward();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _stickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      AnimatedTextSlideBoxTransition(
        controller: _titleController,
        text: ksBrowseProjects,
        coverColor: kPrimary,
        maxLines: 2,
        textAlign: TextAlign.center,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.titleSmall,
          Theme.of(context).textTheme.headlineMedium,
        ),
      ).addAlign(alignment: Alignment.center),
      AnimatedSlideBox(
        controller: _stickController,
        height: context.percentHeight(s30),
        isVertical: true,
        coverColor: kPrimary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
        width: s6,
      ).addAlign(alignment: Alignment.bottomCenter),
    ].addStack().addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight - context.appBarTheme().toolbarHeight!,
        );
  }
}
