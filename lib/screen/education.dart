///
/// screen/education.dart
///
import 'package:flutter/material.dart';


import 'package:cv_app/theme.dart';
import 'package:cv_app/widget/appBar.dart';
import 'package:cv_app/model/airtable_data_education.dart';
 
class EducationScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: appBar("Formations"),
        body: SingleChildScrollView(
         padding: const EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget> [   
            Container(
              child: FutureBuilder(
                future: airtableData.getEducation(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
                  if (snapshot.hasData) {
                    List<AirtableDataEducation>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map(
                            (AirtableDataEducation value) => ListTile(
                              leading: Image.network(value.image, width: 60),
                              title: Text(
                                value.title,
                                style: heading,
                              ),
                              subtitle: Wrap(
                                children: [   
                                  Text(value.details)
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
