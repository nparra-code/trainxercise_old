import 'package:flutter/material.dart';

class EditSetScreen extends StatelessWidget {
  const EditSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Set"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            child: Row(
              children: const [
                Text("Lorem ipsum"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
