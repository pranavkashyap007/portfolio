import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:portfolio_flutter/presentation/views/wrapper.dart';

import 'subviews/background_story.dart';

import 'subviews/who_am_i.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final _key = GlobalKey();
  List<Widget> aboutPages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    aboutPages = const [
      WhoAmI(),
      BackgroundStory(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: aboutPages.addListView(
        key: _key,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
