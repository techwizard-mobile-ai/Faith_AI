import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/routes/app_route.dart';

//For the firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create an instance of the generated AppRouter
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive); // Or SystemUiMode.manual with overlays: []
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate:
          _appRouter.delegate(), // The router delegate handles navigation
      routeInformationParser: _appRouter
          .defaultRouteParser(), // The route information parser for deep links
    );
  }
}
