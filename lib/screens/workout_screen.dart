import 'package:flutter/material.dart';
import 'package:trainxercise/widgets/set_listview_widget.dart';

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
          centerTitle: true,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Today's Routine",
                            style: TextStyle(
                                fontFamily: "Gotham Rounded",
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          FloatingActionButton(
                            onPressed: () => {},
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            highlightElevation: 0,
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
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(right: 50, left: 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text(
                          "Done",
                          style: TextStyle(fontFamily: "Gotham Rounded"),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
