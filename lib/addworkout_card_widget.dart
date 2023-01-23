import 'package:flutter/material.dart';
import 'editset_screen.dart';

List<String> exerciseList = [
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

  const AddWorkoutCardWidget({super.key, required this.setReps});

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Set",
                      style: TextStyle(
                          fontFamily: "Gotham Rounded",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9163E4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Reps: ${widget.setReps}",
                        style: const TextStyle(fontFamily: "Gotham Rounded", color: Colors.white),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const EditSetScreen()))
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      highlightElevation: 0,
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.edit),
                    ),
                    FloatingActionButton(
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
                  padding: EdgeInsets.all(5.0),
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
