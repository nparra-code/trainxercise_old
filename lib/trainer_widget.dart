import 'package:flutter/material.dart';
import 'package:trainxercise/personalinfo_widget.dart';

class TrainerWidget extends StatefulWidget {
  const TrainerWidget({Key? key}) : super(key: key);

  @override
  State<TrainerWidget> createState() => _TrainerWidgetState();
}

class _TrainerWidgetState extends State<TrainerWidget> {
  @override
  Widget build(BuildContext context) {
    var trainerName = "Lorem ipsum";
    if (PersonalInfoWidget.haveTrainer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PersonalInfoWidget.addPersonalInfo("Trainer", trainerName),
          ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: const Text("Change")),
          ElevatedButton(
              onPressed: () {
                PersonalInfoWidget.haveTrainer = false;
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: const Text("Remove"))
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PersonalInfoWidget.addPersonalInfo("Trainer", "None"),
          ElevatedButton(
              onPressed: () => {PersonalInfoWidget.haveTrainer = true},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: const Text("Add"))
        ],
      );
    }
  }
}
