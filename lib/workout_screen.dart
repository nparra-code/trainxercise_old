import 'package:flutter/material.dart';
import 'package:trainxercise/set_listview.dart';

List<String> exerciseList = [
  "Lorem ipsum",
  "Dolor sit amet",
  "Consectetur adipiscing",
  "Suspendisse mattis"
];

List<String> descList = [
  "Proin sollicitudin magna eget dui cursus.",
  "Eget posuere leo tincidunt.",
  "Quisque eget eros diam.",
  "At malesuada sem rhoncus sed."
];

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainxercise'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Exercises"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(207, 207, 207, 100),
          ),
          padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
          child: ListView(
            children: [
              SetListView(
                setTitle: "Set 1",
                exercises: exerciseList,
                descriptions: descList,
                reps: 2,
              ),
              SetListView(
                setTitle: "Set 2",
                exercises: exerciseList,
                descriptions: descList,
                reps: 4,
              ),
              SetListView(
                setTitle: "Set 3",
                exercises: exerciseList,
                descriptions: descList,
                reps: 4,
              ),
              SetListView(
                setTitle: "Finish",
                exercises: exerciseList,
                descriptions: descList,
                reps: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
