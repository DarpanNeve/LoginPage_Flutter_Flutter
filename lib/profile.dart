import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("data"),
              ElevatedButton(
                onPressed: () {
                  AuthService().signOut();
                },
                child: const Text("SignOut"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
