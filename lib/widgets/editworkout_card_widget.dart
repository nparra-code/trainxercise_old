import 'package:flutter/material.dart';

class EditWorkoutCard extends StatelessWidget {
  final String exerciseName;

  const EditWorkoutCard({super.key, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    final double textInputSize = MediaQuery.of(context).size.width * 0.3;

    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10, bottom: 10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-3, 3),
                    blurRadius: 5,
                    spreadRadius: .5)
              ]),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  exerciseName,
                  style: const TextStyle(
                      fontFamily: "Gotham Rounded", fontSize: 16),
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: textInputSize,
                        child: const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: "Weight"),
                          keyboardType: TextInputType.phone,
                        )),
                    SizedBox(
                        width: textInputSize,
                        child: const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: "Units"),
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
