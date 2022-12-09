import 'package:flutter/material.dart';
import 'package:trainxercise/addworkout_card_widget.dart';

class AddWorkoutScreen extends StatelessWidget {
  Future<List<Map<dynamic, dynamic>>> test;
  AddWorkoutScreen({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    final double buttonPadding = MediaQuery.of(context).size.height*0.15;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Workout"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(
                children: const [
                  AddWorkoutCardWidget(
                    setReps: 1,
                  ),
                  AddWorkoutCardWidget(
                    setReps: 3,
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(right: buttonPadding, left: buttonPadding)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontFamily: "Gotham Rounded",
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
