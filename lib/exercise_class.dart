import 'dart:convert';
import 'dart:io';

class ExerciseClass {
  late int id;
  late String name;
  late String description;
  late bool haveWeight;

  late int weight;
  late int reps;

  static Future<List<Map>> readJSONFile(String filePath) async {
    var input = await File(filePath).readAsString();
    var map = jsonDecode(input);
    return map["exercises"];
  }
}
