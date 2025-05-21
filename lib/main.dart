import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:portfolio_flutter/presentation/route/routes.dart';
import 'package:portfolio_flutter/presentation/utils/custom_scroll_behaviour.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Pranav Kashyap Gujja',
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: context.theme(),
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.home;
}
