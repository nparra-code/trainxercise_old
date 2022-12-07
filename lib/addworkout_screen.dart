import 'package:flutter/material.dart';
import 'package:trainxercise/addworkout_card_widget.dart';

class AddWorkoutScreen extends StatelessWidget {
  const AddWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  AddWorkoutCardWidget(setReps: 1,),
                  AddWorkoutCardWidget(setReps: 3,)
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
