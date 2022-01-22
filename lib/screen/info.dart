///
/// screen/info.dart
///
import 'package:flutter/material.dart';

import 'package:cv_app/theme.dart';
import 'package:cv_app/widget/appBar.dart';
import 'package:cv_app/model/airtable_data_info.dart';
 
class InfoScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: appBar("Infos"),
        body: SingleChildScrollView(
         padding: const EdgeInsets.all(10),
        //  child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children:  <Widget> [   
        //     Container(
        //       height: 800,
        //       child: FutureBuilder(
        //         future: airtableData.getInfo(),
        //         builder: (BuildContext context,
        //             AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
        //           if (snapshot.hasData) {
        //             List<AirtableDataInfo>? values = snapshot.data;
        //             return ListView(
        //               children: values!
        //                   .map(
        //                     (AirtableDataInfo value) => ListTile(
        //                       leading: Image.network(value.logo, width: 100),
        //                       title: Text(
        //                         value.title,
        //                         style: heading,
        //                       ),
        //                       subtitle: Wrap(
        //                         children: [ 
        //                           Padding(
        //                             padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        //                             child: Text(
        //                               value.function + " " + value.date, 
        //                               style: const TextStyle(fontFamily: 'raleway', fontStyle: FontStyle.italic, fontSize: 14),
        //                             ),
        //                           ),
                                  
        //                           Text(value.notes)
        //                         ]
        //                       ),
        //                       contentPadding: EdgeInsets.all(10.0),
        //                       isThreeLine: true
        //                     ),
        //                   )
        //                   .toList(),
        //             );
        //           } else {
        //             return Center(child: CircularProgressIndicator());
        //           }
        //         },
        //       ),
        //     ), 
        //   ],
        // ),
        ),
      );
    }
}
