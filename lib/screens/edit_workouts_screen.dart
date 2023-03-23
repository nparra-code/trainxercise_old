import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trainxercise/widgets/workout_card.dart';

class EditWorkoutScreen extends StatefulWidget {
  final workouts;
  const EditWorkoutScreen({super.key, required this.workouts});

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  MaterialColor primaryColor = const MaterialColor(0xFF580BF1, {
    50: Color.fromRGBO(88, 11, 241, .1),
    100: Color.fromRGBO(88, 11, 241, .2),
    200: Color.fromRGBO(88, 11, 241, .3),
    300: Color.fromRGBO(88, 11, 241, .4),
    400: Color.fromRGBO(88, 11, 241, .5),
    500: Color.fromRGBO(88, 11, 241, .6),
    600: Color.fromRGBO(88, 11, 241, .7),
    700: Color.fromRGBO(88, 11, 241, .8),
    800: Color.fromRGBO(88, 11, 241, .9),
    900: Color.fromRGBO(88, 11, 241, 1)
  });

  var workoutsToDisplay = [];
  var workoutExercises = [];
  var workoutDescription = [];

  @override
  void initState() {
    workoutsToDisplay = widget.workouts;
    for (var i = 0; i < workoutsToDisplay.length; i++) {
      var allWorkoutExercises = [];
      for (var j = 0; j < workoutsToDisplay[i]["exercises"].length; j++) {
        allWorkoutExercises.add(workoutsToDisplay[i]["exercises"][j]);
      }
      workoutExercises.add(allWorkoutExercises);
      workoutDescription.add(workoutsToDisplay[i]["description"]);
    }
    super.initState();
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2100));
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Workouts"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.05),
            child: ElevatedButton(
                onPressed: () => {
                      _selectDate(context).then((value) {
                        if (value != null) {
                          workoutsToDisplay.clear();
                          FirebaseFirestore.instance
                              .collection("workouts")
                              .snapshots()
                              .listen((event) {
                            for (var workout in event.docs) {
                              if (workout["date"] == "$value") {
                                setState(() => workoutsToDisplay.add(workout));
                              }
                            }
                          });
                        }
                      })
                    },
                child: const Text("Select Date")),
          ),
          workoutsToDisplay.isNotEmpty
              ? Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ListView.builder(
                          itemCount: workoutExercises.length,
                          itemBuilder: ((context, index) {
                            return WorkoutCard(
                              exercises: workoutExercises[index],
                              description: workoutDescription[index],
                            );
                          }))))
              : const Text("No workouts for this date."),
        ],
      ),
    );
  }
}
