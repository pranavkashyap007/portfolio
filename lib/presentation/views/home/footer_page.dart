import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio_flutter/presentation/configs/configs.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> with TickerProviderStateMixin {
  late AnimationController _footerTextController;
  late AnimationController _slideController;
  late AnimationController _lineController;

  final Color _footerForegroundColor = kSecondary;

  @override
  void initState() {
    super.initState();

    _footerTextController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _lineController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _footerTextController.dispose();
    _slideController.dispose();
    _lineController.dispose();
    super.dispose();
  }

  Widget _footerContent() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedTextSlideBoxTransition(
            controller: _footerTextController,
            text: ksLetsWork,
            maxLines: 2,
            textAlign: TextAlign.center,
            textStyle: context
                .adaptive<TextStyle?>(
                  Theme.of(context).textTheme.titleSmall,
                  Theme.of(context).textTheme.titleLarge,
                  md: Theme.of(context).textTheme.titleMedium,
                )
                ?.copyWith(
                  color: _footerForegroundColor,
                ),
            boxColor: kSecondary,
            coverColor: kBlack,
          ),
          verticalSpaceMassive,
          AnimatedTextSlideBoxTransition(
            controller: _footerTextController,
            text: ksFreelanceAvailability,
            maxLines: 2,
            textAlign: TextAlign.center,
            textStyle: context
                .adaptive<TextStyle?>(
                  Theme.of(context).textTheme.titleSmall,
                  Theme.of(context).textTheme.titleLarge,
                  md: Theme.of(context).textTheme.titleMedium,
                )
                ?.copyWith(
                  color: _footerForegroundColor,
                ),
            boxColor: kSecondary,
            coverColor: kBlack,
          ),
          verticalSpaceMassive,
          AnimatedBuilder(
            animation: _lineController,
            builder: (context, child) {
              return Container(
                width: 200 * _lineController.value,
                height: 2,
                color: _footerForegroundColor,
              );
            },
          ),
          verticalSpaceMassive,
          Text(
            ksContactInfo,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: _footerForegroundColor,
                ),
          ),
          verticalSpaceMassive,
          Text(ksWorkEmail, style: TextStyle(color: _footerForegroundColor)),
          Text(ksWorkPhone, style: TextStyle(color: _footerForegroundColor)),
          verticalSpaceMassive,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("footer_page"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _footerTextController.forward();
          _slideController.forward();
          _lineController.forward();
        } else if (info.visibleFraction < 0.3) {
          _footerTextController.reverse();
          _slideController.reverse();
          _lineController.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _slideController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 50 * (1 - _slideController.value)),
            child: Opacity(
              opacity: _slideController.value,
              child: _footerContent(),
            ),
          );
        },
      ),
    );
  }
}
