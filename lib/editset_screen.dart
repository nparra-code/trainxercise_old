import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditSetScreen extends StatelessWidget {
  EditSetScreen({super.key});

  List _exercises = [];

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/exerciseDatabase.json');
    final data = await json.decode(response);
    _exercises = data["exercises"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Set"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: readJson,
            child: const Text("Load Data")),
        _exercises.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: _exercises.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text(_exercises[index]["id"]),
                          title: Text(_exercises[index]["name"]),
                          subtitle: Text(_exercises[index]["description"]),
                        ),
                      );
                    }))
            : Container()
      ]),
    );
  }
}
