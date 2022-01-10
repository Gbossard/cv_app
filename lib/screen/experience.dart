///
/// screen/experience.dart
///
import 'package:flutter/material.dart';

import 'package:cv_app/model/airtable_data_experience.dart';
 
class ExperienceScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return SingleChildScrollView(
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
                              title: Text(
                                value.title,
                                style: 
                                  FontWeight.bold,
                              ),
                              subtitle: Text("${value.function}(${value.date}) \n${value.notes}"),
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
      );
    }
}
