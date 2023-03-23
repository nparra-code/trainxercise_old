import 'package:flutter/material.dart';
import 'package:trainxercise/widgets/addworkout_card_widget.dart';

class AddWorkoutScreen extends StatelessWidget {
  const AddWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonPadding = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Workout"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return AddWorkoutCardWidget(
                    setReps: 4,
                    setNumber: '$index',
                  );
                },
                //AddWorkoutCardWidget(
                //setReps:
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      right: buttonPadding, left: buttonPadding)),
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
