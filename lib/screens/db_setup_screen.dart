import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DBSetUp extends StatefulWidget {
  const DBSetUp({super.key});

  @override
  State<DBSetUp> createState() => _DBSetUpState();
}

class _DBSetUpState extends State<DBSetUp> {
  @override
  Widget build(BuildContext context) {
    List toList(String str, bool flUpperCase) {
      List toReturnList = [];
      String aux = "";
      if (flUpperCase) {
        for (var i = 0; i < str.length; i++) {
          if (str[i] != ',') {
            if (aux == "") {
              aux = aux + str[i].toUpperCase();
            } else {
              aux = aux + str[i].toLowerCase();
            }
          } else {
            toReturnList.add(aux);
            aux = "";
          }
        }
      } else {
        for (var i = 0; i < str.length; i++) {
          if (str[i] != ',') {
            aux = aux + str[i];
          } else {
            aux = aux.toLowerCase();
            toReturnList.add(aux);
            aux = "";
          }
        }
      }
      return toReturnList;
    }

    TextEditingController categoriesController = TextEditingController();
    TextEditingController haveWeightController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController variationsController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Column(
        children: [
          TextField(
            controller: categoriesController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: haveWeightController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
          ),
          TextField(
              controller: variationsController,
              keyboardType: TextInputType.text),
          ElevatedButton(
              onPressed: () {
                List categories = toList(categoriesController.text, false);
                List variations = variationsController.text.isNotEmpty
                    ? toList(variationsController.text, true)
                    : [""];
                bool haveWeight =
                    haveWeightController.text == "true" ? true : false;
                CollectionReference exerciseCollection =
                    FirebaseFirestore.instance.collection("exercise");
                exerciseCollection.add({
                  'categories': categories,
                  'haveWeight': haveWeight,
                  'name': nameController.text,
                  'variations': variations
                });
              },
              child: const Text("Add Excercise"))
        ],
      ),
    );
  }
}
