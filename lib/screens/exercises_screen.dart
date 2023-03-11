import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trainxercise/db_manager.dart';

class ExercisesScreen extends StatefulWidget {
  List exercises = [];

  ExercisesScreen({super.key, required this.exercises});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String lastText = "", newText = "";
  List foundExercises = [];

  @override
  void initState() {
    // TODO: implement initState
    foundExercises = widget.exercises;
    super.initState();
  }

  void _runFilter(String enteredSearch) {
    List results = [];

    enteredSearch.isNotEmpty
        ? results = widget.exercises
            .where((element) => element["name"]
                .toLowerCase()
                .contains(enteredSearch.toLowerCase()))
            .toList()
        : results = widget.exercises;

    setState(() {
      foundExercises = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Exercises List',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              onChanged: (text) => _runFilter(text),
              decoration: InputDecoration(
                  hintText: "Search exercise",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                prefixIcon: const Icon(Icons.search)
              ),
              controller: _searchController,
            ),
            SizedBox(height: 12,),
            widget.exercises.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                    itemCount: foundExercises.length,
                    itemBuilder: (context, index) {
                      final _exercise = foundExercises[index];
                      String _variations = "";
                      if (_exercise["variations"][0] != "") {
                        _variations = "Variations:";
                        for (String variat in _exercise["variations"]) {
                          if (variat ==
                              _exercise["variations"]
                                  [_exercise["variations"].length - 1]) {
                            _variations += " $variat.";
                          } else {
                            _variations += " $variat,";
                          }
                        }
                      }
                      return Card(
                        color: Colors.amber.shade50,
                        child: ListTile(
                          leading: Text(index.toString()),
                          title: Text(_exercise["name"]),
                          subtitle: Text(_variations.isNotEmpty
                              ? _variations
                              : "There are no variations."),
                        ),
                      );
                    },
                  ))
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

Color cardColors(_value) {
  if (_value["haveWeight"]) return Colors.green;
  return Colors.red;
}
