import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/model/showcase_project.dart';
import 'package:portfolio_flutter/presentation/route/route_transitions.dart';
import 'package:portfolio_flutter/presentation/route/routes.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/views/project_details/project_details_view.dart';

import '../../../configs/configs.dart';

class AnimatedProjectCard extends AnimatedWidget {
  const AnimatedProjectCard({
    super.key,
    required this.animation,
    required this.bgColor,
    required this.project,
    this.index = 0,
  }) : super(listenable: animation);

  final Animation<double> animation;
  final Color bgColor;
  final int index;
  final ShowcaseProject project;

  void navigateToProjectDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      SlideRouteTransition(
        position: SlidePosition.right,
        enterWidget: ProjectDetailsView(
          project: project,
        ),
        settings: RouteSettings(
          name: '${Routes.projectDetails}/${project.title}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToProjectDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          width: context.percentWidth(context.adaptive(s70, s20)),
          height: context.percentHeight(context.adaptive(s100, s50)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s20),
            color: bgColor,
          ),
          padding: context.allPadding(p: s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                project.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: context.percentHeight(s30),
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                project.shortDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
