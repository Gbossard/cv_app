///
/// model/airtable_data_skill.dart
///

import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';
 
class AirtableDataSkill {
  String id;
  String createdTime;
  String category;
  String skills;
 
  AirtableDataSkill({
    required this.id,
    required this.createdTime,
    required this.category,
    required this.skills
  });
}
 
class AirtableData {
  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/skill",
    {"maxRecords": "10", "view": "Grid view"},
  );
 
  Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );
 
    print(res.body);
 
    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];
 
      print(data);
 
      List<AirtableDataSkill> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataSkill(
              id: value['id'],
              createdTime: value['createdTime'],
              category: value['fields']['category'],
              skills: value['fields']['skills']
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
