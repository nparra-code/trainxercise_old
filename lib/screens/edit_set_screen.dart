import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainxercise/main.dart';
import 'package:trainxercise/widgets/editworkout_card_widget.dart';

class EditSetScreen extends StatelessWidget {
  List exercises;

  EditSetScreen({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    double tPaddingButton = MediaQuery.of(context).size.height * 0.6;
    double lPaddingButton = MediaQuery.of(context).size.width * 0.83;
    double bPaddingButton = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Edit Set"),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  return EditWorkoutCard(exerciseName: exercises[index]);
                },
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: tPaddingButton, left: lPaddingButton, bottom: bPaddingButton),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      heroTag: "addExercise",
                      onPressed: () {},
                      backgroundColor: primaryColor.withOpacity(1),
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      heroTag: "saveSettings",
                      onPressed: () {},
                      backgroundColor: primaryColor.withOpacity(1),
                      child: const Icon(Icons.done),
                    ),
                    FloatingActionButton(
                      heroTag: "discardSettigs",
                      onPressed: () {},
                      backgroundColor: primaryColor.withOpacity(1),
                      child: const Icon(Icons.exit_to_app_outlined),
                    ),
                  ],
                ))
          ],
        ));
  }
}
