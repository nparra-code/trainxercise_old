import 'package:flutter/material.dart';
import '../screens/edit_set_screen.dart';

List<String> exerciseList = [
  "Lorem ipsum",
  "Dolor sit amet",
  "Consectetur adipiscing",
  "Suspendisse mattis",
  "Lorem ipsum",
  "Dolor sit amet",
  "Consectetur adipiscing",
  "Suspendisse mattis"
];

List<String> descList = [
  "Proin sollicitudin magna eget dui cursus.",
  "Eget posuere leo tincidunt.",
  "Quisque eget eros diam.",
  "At malesuada sem rhoncus sed."
];

class AddWorkoutCardWidget extends StatefulWidget {
  final int setReps;
  final String? setNumber;

  const AddWorkoutCardWidget(
      {super.key, required this.setReps, this.setNumber});

  @override
  State<AddWorkoutCardWidget> createState() => _AddWorkoutCardWidgetState();
}

class _AddWorkoutCardWidgetState extends State<AddWorkoutCardWidget> {
  @override
  Widget build(BuildContext context) {
    const _divider = Divider(
      color: Colors.grey,
      height: 0,
      thickness: 1,
    );
    return Container(
        padding: const EdgeInsets.all(15.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    right: 5, top: 5, bottom: 5, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Set ${widget.setNumber}, ${widget.setReps} reps",
                      style: const TextStyle(
                          fontFamily: "Gotham Rounded",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 75,
                      height: 2,
                      //color: Colors.black,
                    ),
                    FloatingActionButton(
                      heroTag: "editSet${widget.setNumber}",
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EditSetScreen(
                                  exercises: exerciseList,
                                )))
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      highlightElevation: 0,
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.edit),
                    ),
                    FloatingActionButton(
                      heroTag: "deleteSet${widget.setNumber}",
                      onPressed: () => {},
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      highlightElevation: 0,
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.delete_outline),
                    )
                  ],
                ),
              ),
              _divider,
              for (var exercise in exerciseList)
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    exercise,
                    style: const TextStyle(
                        fontFamily: "Gotham Rounded", fontSize: 16),
                  ),
                )
            ],
          ),
        ));
  }
}
