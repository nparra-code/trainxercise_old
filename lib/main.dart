import 'package:flutter/material.dart';
import 'package:trainxercise/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trainxercise/login_state.dart';
import 'login_page.dart';
import 'package:provider/provider.dart';

// ...

Map<int, Color> color = {
  50: const Color.fromRGBO(88, 11, 241, .1),
  100: const Color.fromRGBO(88, 11, 241, .2),
  200: const Color.fromRGBO(88, 11, 241, .3),
  300: const Color.fromRGBO(88, 11, 241, .4),
  400: const Color.fromRGBO(88, 11, 241, .5),
  500: const Color.fromRGBO(88, 11, 241, .6),
  600: const Color.fromRGBO(88, 11, 241, .7),
  700: const Color.fromRGBO(88, 11, 241, .8),
  800: const Color.fromRGBO(88, 11, 241, .9),
  900: const Color.fromRGBO(88, 11, 241, 1)
};
MaterialColor primaryColor = MaterialColor(0xFF580BF1, color);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() {
    print("firebase initialized");
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedIn = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (context) => LoginState(),
      child: MaterialApp(
        title: 'Trainxercise',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        routes: {
          '/': ((context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          })
        },
      ),
    );
  }
}
