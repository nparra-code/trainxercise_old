import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainxercise/screens/add_workout_screen.dart';
import 'package:trainxercise/screens/db_setup_screen.dart';
import 'package:trainxercise/screens/edit_workouts_screen.dart';
import 'package:trainxercise/screens/exercises_screen.dart';
import 'package:trainxercise/screens/profile_screen.dart';
import 'package:trainxercise/screens/workout_screen.dart';

class HomePage extends StatefulWidget {
  final List exercises = [];
  final List workouts = [];

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentInd = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const WorkoutScreen(),
      ExercisesScreen(exercises: widget.exercises),
      EditWorkoutScreen(workouts: widget.workouts,),
      //Container(),
      const ProfileScreen(),
      const DBSetUp()
    ];
    FirebaseFirestore.instance
        .collection("exercise")
        .snapshots()
        .listen((event) {
      widget.exercises.clear();
      for (var element in event.docs) {
        widget.exercises.add(element);
      }
    });
    FirebaseFirestore.instance
        .collection("workouts")
        .snapshots()
        .listen((event) {
      widget.workouts.clear();
      for (var element in event.docs) {
        widget.workouts.add(element);
      }
    });
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Workout"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Exercises"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: "Add Workout"),
            //BottomNavigationBarItem(
            //    icon: Icon(Icons.person_add), label: "Add Others"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "DB")
          ],
          fixedColor: const Color.fromRGBO(88, 11, 241, 1),
          unselectedItemColor: Colors.black,
          currentIndex: currentInd,
          onTap: (index) {
            setState(() {
              currentInd = index;
            });
          }),
      body: screens[currentInd],
    );
  }
}
