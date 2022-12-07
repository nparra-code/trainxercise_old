import 'package:flutter/material.dart';
import 'package:trainxercise/set_listview.dart';

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

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trainxercise'),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Today's Routine",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          FloatingActionButton(
                            onPressed: () => {},
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            foregroundColor: Colors.black,
                            child: const Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.62,
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 20, left: 20),
                      child: ListView(
                        children: [
                          SetListView(
                            setTitle: "Set 1",
                            exercises: exerciseList,
                            descriptions: descList,
                            reps: 2,
                          ),
                          SetListView(
                            setTitle: "Set 2",
                            exercises: exerciseList,
                            descriptions: descList,
                            reps: 4,
                          ),
                          SetListView(
                            setTitle: "Set 3",
                            exercises: exerciseList,
                            descriptions: descList,
                            reps: 4,
                          ),
                          SetListView(
                            setTitle: "Finish",
                            exercises: exerciseList,
                            descriptions: descList,
                            reps: 0,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(top: 7, right: 20),
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text("Done"),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
