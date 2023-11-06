import 'package:flutter/material.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lunan/Patient/Homepage/Dashboard/dashboard_modal.dart';
import 'package:lunan/splash_screen.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_)
    {
      runApp(const MyApp());
    }
  
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // routes: {
      //   '/weeklyFormsQuestion': (context) => DashboardModal(),
      // },
    );
  }
}
