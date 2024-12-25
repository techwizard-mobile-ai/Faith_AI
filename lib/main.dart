import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/routes/app_route.dart';

//For the firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//For the Use of the dot_env
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  // Ensure that BackgroundIsolateBinaryMessenger is initialized
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
