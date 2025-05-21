import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key, required this.onTapSeeMyWorks})
      : super(key: key);
  final VoidCallback onTapSeeMyWorks;
  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> blueCircleTween;
  late Animation<double> whiteCircleTween;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration3000,
    )..forward();
    _controller2 = AnimationController(
      vsync: this,
      duration: duration3000,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? titleTextStyle = context.adaptive(
      Theme.of(context).textTheme.titleMedium,
      Theme.of(context).textTheme.headlineSmall,
      md: Theme.of(context).textTheme.titleLarge,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:
              MainAxisSize.min, // Ensure the column takes minimum space
          children: [
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              coverColor: Theme.of(context).scaffoldBackgroundColor,
              text: ksFlutterDeveloperAnd,
              textStyle: titleTextStyle,
            ),
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              coverColor: Theme.of(context).scaffoldBackgroundColor,
              text: ksAiMlEnthusiast,
              textStyle: titleTextStyle,
            ),
            verticalSpaceMassive,
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              text: ksIntro,
              coverColor: Theme.of(context).scaffoldBackgroundColor,
              textStyle: Theme.of(context).textTheme.bodyLarge,
              maxLines: 10,
            ),
            verticalSpaceMassive,
            Center(
              child: IntrinsicWidth(
                child: CustomButton(
                  label: ksSeeMyWork,
                  onPressed: widget.onTapSeeMyWorks,
                  icon: kiArrowForward,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedHoverLink(
                  label: ksLinkedIn,
                  controller: _controller,
                ).addInkWell(onTap: ksLinkedInLink.launchWebsite),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
