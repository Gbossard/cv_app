///
/// screen/info.dart
///

import 'package:flutter/material.dart';

import 'package:cv_app/theme.dart';
import 'package:cv_app/widget/appBar.dart';
import 'package:cv_app/widget/imageStack.dart';
import 'package:cv_app/model/airtable_data_info.dart';
 
class InfoScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: appBar("Infos"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget> [   
              Container(
                child: FutureBuilder(
                  future: airtableData.getInfo(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
                    if (snapshot.hasData) {
                      List<AirtableDataInfo>? values = snapshot.data;
                      return ListView(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: values!
                            .map(
                                (AirtableDataInfo value) => ListTile(
                                  title: imageStack(value.image, value.title, value.text)
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
