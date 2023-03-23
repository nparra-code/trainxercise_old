import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trainxercise/main.dart';

class WorkoutCard extends StatelessWidget {
  List exercises;
  List description;
  WorkoutCard({super.key, required this.exercises, required this.description});

  @override
  Widget build(BuildContext context) {
    double sectionOcupied = double.parse("0.${exercises.length}");
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * sectionOcupied,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < exercises.length; i++)
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(exercises[i],
                                style: const TextStyle(
                                    fontFamily: "Gotham Rounded")),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Reps: ${description[i]["reps"]}",
                                      style: const TextStyle(
                                          fontFamily: "Gotham Rounded",
                                          fontWeight: FontWeight.w100)),
                                  Text(
                                      description[i]["variation"] != null
                                          ? "Variation: ${description[i]["variation"]}"
                                          : "There is no variation for the exercise.",
                                      style: const TextStyle(
                                          fontFamily: "Gotham Rounded",
                                          fontWeight: FontWeight.w100)),
                                  Text("Weight: ${description[i]["weight"]}",
                                      style: const TextStyle(
                                          fontFamily: "Gotham Rounded",
                                          fontWeight: FontWeight.w100))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.7,
                  top: MediaQuery.of(context).size.height *
                      (sectionOcupied - 0.035)),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: primaryColor.withOpacity(1),
                child: const Icon(Icons.edit),
              ),
            ),
            /*FloatingActionButton(
                onPressed: () {
                  CollectionReference workoutCollection =
                      FirebaseFirestore.instance.collection("workouts");
                  workoutCollection.add({
                    'date':
                        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                    'description': [
                      {'reps': 10, 'variation': null, 'weight': 20},
                      {'reps': 10, 'variation': null, 'weight': 20},
                      {'reps': 10, 'variation': null, 'weight': 20},
                      {'reps': 10, 'variation': null, 'weight': 20}
                    ],
                    'exercises': ['Exercise1', 'Exercise2', 'Exercise3', 'Exercise4'],
                    'user': 'loremipsum'
                  });
                },
                child: const Icon(Icons.add))*/
          ],
        ),
        const SizedBox(height: 15.0)
      ],
    );
  }
}