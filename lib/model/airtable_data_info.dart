///
/// model/airtable_data.dart
///

import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';
 
class AirtableDataInfo {
  String id;
  String createdTime;
  String title;
  String text;
  String image;
 
  AirtableDataInfo({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.text,
    required this.image
  });
}
 
class AirtableData {
  final Uri urlInfo = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/info",
    {"maxRecords": "10", "view": "Grid view"},
  );
 
  Future<List<AirtableDataInfo>> getInfo() async {
    final res = await http.get(
      urlInfo,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );
 
    print(res.body);
 
    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];
 
      print(data);
 
      List<AirtableDataInfo> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataInfo(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              text: value['fields']['text'],
              image: value['fields']['image'][0]['url']
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
