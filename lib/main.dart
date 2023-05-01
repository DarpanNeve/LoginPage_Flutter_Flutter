import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'auth_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    RobotDetector(
      debug: true, // you can set true to enable robot mode
      child: MaterialApp(
        home: MyApp(),
        navigatorObservers: [seoRouteObserver],
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo App",
      
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(
                width: 200,
                child: Icon(Icons.account_circle,size: 200),
              ),
              const Text("Data"),
              ElevatedButton(
                onPressed: () async {
                  AuthService().signInWithGoogle();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
