import 'dart:convert';

import 'package:flutter/services.dart';

class GetDataDB {

  List _exercises = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/exerciseDatabase.json');
    final data = await json.decode(response);
    _exercises = data["exercises"];
  }

  List getJsonData(){
    readJson();
    return _exercises;
  }
}
