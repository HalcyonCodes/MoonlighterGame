import 'package:flutter/material.dart';
import './Route/application.dart';
import 'package:fluro/fluro.dart';
import './Route/routes.dart';



void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRotes(router);
    Application.router = router;
    return MaterialApp(
      title: 'Moonlighter',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router!.generator,
      onGenerateInitialRoutes: (d) {
        return Application.router!.generatorInitail('/HomePage');
      },
    );
  }
}


