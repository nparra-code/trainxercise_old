import 'package:flutter/material.dart';
import 'package:trainxercise/widgets/personalinfo_widget.dart';

class MedicalWidget extends StatelessWidget {
  final bloodtype;
  final alergies;

  const MedicalWidget(
      {super.key, required this.bloodtype, required this.alergies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Medical Information",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(height: 10),
        PersonalInfoWidget.addPersonalInfo("Bloodtype", bloodtype),
        PersonalInfoWidget.addPersonalInfo("Alergies", alergies)
      ],
    );
  }
}
