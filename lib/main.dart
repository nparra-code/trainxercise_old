import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainxercise/profile_screen.dart';
import 'package:trainxercise/workout_screen.dart';

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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentInd = 0;
  final screens = [
    WorkoutScreen(),
    Container(),
    Container(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Trainxercise',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Workout"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Exercises"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: "Add Workout"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          fixedColor: const Color.fromRGBO(88, 11, 241, 1),
          unselectedItemColor: Colors.black,
          currentIndex: currentInd,
          onTap: (index) => setState( ()=> currentInd = index),
        ),
        body: screens[currentInd],
      ),
    );
  }
}
