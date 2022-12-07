import 'package:flutter/material.dart';

class PersonalInfoWidget {
  static var haveTrainer = false;

  static addPersonalInfo(String infoType, dynamic info) {
    if (info is! String) {
      info = info.toString();
    }

    const double _fontSize = 16;
    return Row(
      children: [
        Text(
          "$infoType: ",
          style:
              const TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: _fontSize,
          ),
        )
      ],
    );
  }
}
