import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio_flutter/data/model/showcase_project.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';
import 'info_section.dart';

class ProjectOverview extends StatefulWidget {
  const ProjectOverview({super.key, required this.project});
  final ShowcaseProject project;

  @override
  State<ProjectOverview> createState() => _ProjectOverviewState();
}

class _ProjectOverviewState extends State<ProjectOverview>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _contentController;
  void detectVisibility(VisibilityInfo info) {
    if (info.visibleFraction > 0.45) {
      _titleController.forward();
      _titleController.addStatusListener(_titleControllerListener);
    } else {
      if (_titleController.isCompleted) {
        _titleController.reset();
      }
      if (_contentController.isCompleted) {
        _contentController.reset();
      }
    }
  }

  void _titleControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _contentController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration1000);
    _contentController =
        AnimationController(vsync: this, duration: duration1000);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // AnimatedTextSlideBoxTransition(
      //   controller: _titleController,
      //   text: 'Project Overview',
      //   coverColor: kPrimary,
      //   textStyle: context.adaptive(
      //     Theme.of(context).textTheme.bodyLarge,
      //     Theme.of(context).textTheme.titleMedium,
      //   ),
      // ),
      verticalSpaceMassive,
      Text(
        'Project Overview',
        style: context
            .adaptive(
              Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.bodyMedium,
            )
            ?.copyWith(fontWeight: bold, fontSize: 30),
      ),
      verticalSpaceMassive,
      Text(
        widget.project.description,
        style: context
            .adaptive(
              Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.bodyMedium,
            )
            ?.copyWith(fontSize: 12),
      ),
      verticalSpaceMedium,
      Text(
        "Publications",
        style: context
            .adaptive(
              Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.bodyMedium,
            )
            ?.copyWith(fontWeight: bold, fontSize: 30),
      ),

      verticalSpaceMedium,
      Text(
        "S. Kumar, P. Kashyap, S. Kongara, Y. Tzen, and M. Wijesundara, “Smart Seat Cushion Mobile Application with On-Device Posture Prediction Using TensorFlow Lite,” submitted to Disability and Rehabilitation: Assistive Technology, under review.",
        style: context
            .adaptive(
              Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.bodyMedium,
            )
            ?.copyWith(fontSize: 12),
      ),

      context.percentSizedBox(
        pHeight: s3,
      ),
      <Widget>[
        InfoSection(
          //   controller: _contentController,
          info: widget.project.tech,
        ),
        InfoSection(
          // controller: _contentController,
          info: widget.project.platform,
        ),
        InfoSection(
          //   controller: _contentController,
          info: widget.project.tags,
        ),
        InfoSection(
          //   controller: _contentController,
          info: widget.project.link,
        ),
        InfoSection(
          //  controller: _contentController,
          info: widget.project.author,
        ),
      ].addWrap(),
      verticalSpaceSmall,
    ]
        .addColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addContainer(
          padding: context.symmetricPercentPadding(
            hPercent: context.adaptive(s4, s10),
            vPercent: s0,
          ),
        )
        .addVisibilityDetector(onDetectVisibility: detectVisibility);
  }
}
