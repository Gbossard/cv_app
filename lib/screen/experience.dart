///
/// screen/experience.dart
///
import 'package:flutter/material.dart';

import 'package:cv_app/theme.dart';
import 'package:cv_app/widget/appBar.dart';
import 'package:cv_app/model/airtable_data_experience.dart';
 
class ExperienceScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: appBar("Expérience"),
        body: SingleChildScrollView(
         padding: const EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget> [   
            Container(
              height: 800,
              child: FutureBuilder(
                future: airtableData.getExperience(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
                  if (snapshot.hasData) {
                    List<AirtableDataExperience>? values = snapshot.data;
                    return ListView(
                      children: values!
                          .map(
                            (AirtableDataExperience value) => ListTile(
                              leading: Image.network(value.logo, width: 60),
                              title: Text(
                                value.title,
                                style: heading,
                              ),
                              subtitle: Wrap(
                                children: [ 
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                      value.function + " " + value.date, 
                                      style: const TextStyle(fontFamily: 'raleway', fontStyle: FontStyle.italic, fontSize: 14),
                                    ),
                                  ),
                                  
                                  Text(value.notes)
                                ]
                              ),
                              contentPadding: EdgeInsets.all(10.0),
                              isThreeLine: true
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ), 
          ],
        ),
        ),
      );
    }
}
