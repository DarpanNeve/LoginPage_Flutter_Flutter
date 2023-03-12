import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkSystem();
  runApp(AuthService().handleAuthState());
}

Future<void> checkSystem() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAKsAaz-dMfAldT6JI0UMfPbjd-Tq4yeEQ',
        appId: '1:893826836090:android:5f4b107c2e4d6b14d1fdc3',
        messagingSenderId: '893826836090',
        projectId: 'testing-aa21c',
        storageBucket: 'testing-aa21c.appspot.com',
      ),
    );
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCHfe2CPWVcygUVFFWUHHE_TIdsR13JVas',
        appId: '1:893826836090:ios:b8867481f446db72d1fdc3',
        messagingSenderId: '893826836090',
        projectId: 'testing-aa21c',
        storageBucket: 'testing-aa21c.appspot.com',
        iosClientId:
            '893826836090-a69on9bb2ls0etrrviui6n2kfva52tft.apps.googleusercontent.com',
        iosBundleId: 'com.example.loginApp',
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCR3KdL9YRC6xsj_uUclTP450WwqXxRhV4",
        authDomain: "testing-aa21c.firebaseapp.com",
        projectId: "testing-aa21c",
        storageBucket: "testing-aa21c.appspot.com",
        messagingSenderId: "893826836090",
        appId: "1:893826836090:web:5b6258d1ce2a3cf2d1fdc3",
        measurementId: "G-ZKMC5YK94D",
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                width: 200,
                child:
                    Image(image: AssetImage('assets/images/collegelogo.png')),
              ),
              SizedBox(
                height: 50,
              ),
              SignIn(),
              fetchData(),
            ],
          ),
        ),
      ),
    );
  }
}

class fetchData extends StatefulWidget {
  const fetchData({Key? key}) : super(key: key);

  @override
  State<fetchData> createState() => _fetchDataState();
}

class _fetchDataState extends State<fetchData> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:(){
          request();
        },
        child:
            const ElevatedButton(onPressed: null, child: Text("print data")));
  }

  request() async {

    final response = await http.get(
      Uri.parse('http://117.198.136.16/fetch_Data1.php'),
    );

    if (response.statusCode == 200) {
      // Request was successful
      print('Response body: ${response.body}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthService().signInWithGoogle();
      },
      child: const ElevatedButton(
        onPressed: null,
        child: Text("Data"),
      ),
    );
  }
}
