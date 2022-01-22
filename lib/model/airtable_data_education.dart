///
/// model/airtable_data_education.dart
///

import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';
 
class AirtableDataEducation {
  String id;
  String createdTime;
  String image;
  String title;
  String details;
 
  AirtableDataEducation({
    required this.id,
    required this.createdTime,
    required this.image,
    required this.title,
    required this.details
  });
}
 
class AirtableData {
  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );
 
  Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );
 
    print(res.body);
 
    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];
 
      print(data);
 
      List<AirtableDataEducation> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataEducation(
              id: value['id'],
              createdTime: value['createdTime'],
              image: value['fields']['image'],
              title: value['fields']['title'],
              details: value['fields']['details']
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
