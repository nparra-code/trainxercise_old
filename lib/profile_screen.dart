import 'package:flutter/material.dart';
import 'package:trainxercise/medical_widget.dart';
import 'package:trainxercise/personalinfo_widget.dart';
import 'package:trainxercise/trainer_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const userName = "Lorem ipsum";
  static const userAge = 55;

  @override
  Widget build(BuildContext context) {
    var pictureSize = MediaQuery.of(context).size.width * 0.25;
    const _divider = Divider(
      color: Colors.grey,
      height: 0,
      thickness: 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: pictureSize,
                      width: pictureSize,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(
                        Icons.person_outline_outlined,
                        size: 90,
                      )),
                  SizedBox(
                    height: pictureSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PersonalInfoWidget.addPersonalInfo("Name", userName),
                        PersonalInfoWidget.addPersonalInfo("Age", userAge)
                      ],
                    ),
                  )
                ],
              ),
              _divider,
              const MedicalWidget(bloodtype: "A-", alergies: "None"),
              _divider,
              const TrainerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
