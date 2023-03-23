import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  List exercises;
  List description;
  WorkoutCard({super.key, required this.exercises, required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent.shade100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < exercises.length; i++)
                  Column(
                    children: [
                      Text(exercises[i],
                          style: const TextStyle(fontFamily: "Gotham Rounded")),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reps: ${description[i]["reps"]}",
                                style: const TextStyle(
                                    fontFamily: "Gotham Rounded",
                                    fontWeight: FontWeight.w100)),
                            Text("Variation: ${description[i]["variation"]}",
                                style: const TextStyle(
                                    fontFamily: "Gotham Rounded",
                                    fontWeight: FontWeight.w100)),
                            Text("Weight: ${description[i]["weight"]}",
                                style: const TextStyle(
                                    fontFamily: "Gotham Rounded",
                                    fontWeight: FontWeight.w100))
                          ],
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
              top: MediaQuery.of(context).size.height * 0.57),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
        )
      ],
    );
  }
}