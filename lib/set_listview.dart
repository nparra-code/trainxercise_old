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
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    setTitle,
                    style: const TextStyle(
                        fontFamily: "Gotham Rounded",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    "x$reps",
                    style: const TextStyle(
                        fontFamily: "Gotham Rounded", fontSize: 20),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            for (var item in exercises)
              Container(
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item,
                            style: const TextStyle(
                                fontFamily: "Gotham Rounded", fontSize: 16),
                          ),
                          Text(
                            descriptions.elementAt(exercises.indexOf(item)),
                            style: const TextStyle(
                                fontFamily: "Gotham Rounded",
                                fontWeight: FontWeight.w100,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    //const Icon(Icons.play_arrow)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
