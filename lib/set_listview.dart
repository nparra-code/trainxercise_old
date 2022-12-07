import 'package:flutter/material.dart';

class SetListView extends StatelessWidget {
  String setTitle;
  List<String> exercises;
  List<String> descriptions;
  int reps;

  SetListView(
      {super.key,
      required this.setTitle,
      required this.exercises,
      required this.descriptions,
      required this.reps});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  setTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "x$reps",
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          for (var item in exercises)
            Container(
              padding: EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          child: Text(
                            descriptions.elementAt(exercises.indexOf(item)),
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Icon(Icons.play_arrow)
                ],
              ),
            )
        ],
      ),
    );
  }
}
