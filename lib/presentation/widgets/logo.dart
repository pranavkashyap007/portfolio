import 'package:flutter/material.dart';

import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s20,
      s80,
      md: s60,
    );
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        kaLogo, // Make sure this is the correct path
        width: size,
        height: size,
        fit: BoxFit.contain,
        semanticLabel: 'Logo PNG',
      ).addPadding(edgeInsets: context.padding(l: s10)),
    );
  }
}
