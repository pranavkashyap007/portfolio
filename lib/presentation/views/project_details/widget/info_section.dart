// import 'package:flutter/material.dart';
// import 'package:portfolio_flutter/data/model/project_info.dart';
// import 'package:portfolio_flutter/presentation/configs/constant_sizes.dart';
// import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
// import 'package:portfolio_flutter/presentation/widgets/widgets.dart';

// import '../../../configs/configs.dart';

// class InfoSection extends StatelessWidget {
//   InfoSection({
//     super.key,
//     required this.controller,
//     required this.info,
//   })  : _slideUpAnimation =
//             Tween<Offset>(begin: const Offset(s0, s1), end: Offset.zero)
//                 .animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Curves.easeInOut,
//           ),
//         ),
//         _fadeAnimation = Tween<double>(begin: s0, end: s1).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Curves.easeInOut,
//           ),
//         );
//   final AnimationController controller;
//   final Animation<Offset> _slideUpAnimation;
//   final Animation<double> _fadeAnimation;
//   final ProjectInfo info;
//   @override
//   Widget build(BuildContext context) {
//     return <Widget>[
//       IconLabel(
//         icon: info.icon,
//         controller: controller,
//         label: info.label,
//         coverColor: kPrimary,
//         textStyle: context
//             .adaptive(Theme.of(context).textTheme.bodyMedium,
//                 Theme.of(context).textTheme.bodyLarge)
//             ?.copyWith(
//               fontWeight: FontWeight.w700,
//             ),
//       ),
//       verticalSpaceLarge,
//       ...info.contents.map(
//         (content) {
//           return FadeTransition(
//             opacity: _fadeAnimation,
//             child: SlideTransition(
//               position: _slideUpAnimation,
//               child: GestureDetector(
//                 onTap: () => content.launchWebsite(),
//                 child: Text(
//                   info.isTag == true
//                       ? content.prefixHash()
//                       : content.prefixDash(),
//                   style: TextStyle(
//                     decoration: info.isLink == true
//                         ? TextDecoration.underline
//                         : TextDecoration.none,
//                     decorationColor: kBlack26,
//                   ),
//                 ).addPadding(
//                   edgeInsets: context.padding(
//                     l: 2 * horizontalSpaceMassive.width!,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     ]
//         .addColumn(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//         )
//         .addPadding(
//           edgeInsets: context.padding(
//             r: context.adaptive(s10, s100),
//             b: context.adaptive(s10, s50),
//           ),
//         );
//   }
// }
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/model/project_info.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

/// A simple info block showing icon, label, and list of contents (no animations)
class InfoSection extends StatelessWidget {
  final ProjectInfo info;

  const InfoSection({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconLabel(
          icon: info.icon,
          label: info.label,
          coverColor: kPrimary,
          textStyle: context
              .adaptive(
                Theme.of(context).textTheme.bodyMedium,
                Theme.of(context).textTheme.bodyLarge,
              )
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        verticalSpaceLarge,
        ...info.contents.map((content) {
          final displayText = (info.isTag == true)
              ? content.prefixHash()
              : content.prefixDash();
          return GestureDetector(
            onTap: () => content.launchWebsite(),
            child: Text(
              displayText,
              style: TextStyle(
                decoration: (info.isLink == true)
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: kBlack26,
              ),
            ).addPadding(
              edgeInsets: context.padding(
                l: 2 * (horizontalSpaceMassive.width ?? 0),
              ),
            ),
          );
        }).toList(),
      ],
    ).addPadding(
      edgeInsets: context.padding(
        r: context.adaptive(s10, s100),
        b: context.adaptive(s10, s50),
      ),
    );
  }
}
