///
/// screen/skill.dart
///
import 'package:flutter/material.dart';


import 'package:cv_app/theme.dart';
import 'package:cv_app/widget/appBar.dart';
import 'package:cv_app/model/airtable_data_skill.dart';
 
class SkillScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: appBar("Compétences"),
        body: SingleChildScrollView(
         padding: const EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget> [   
            Container(
              child: FutureBuilder(
                future: airtableData.getSkill(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
                  if (snapshot.hasData) {
                    List<AirtableDataSkill>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map(
                            (AirtableDataSkill value) => ListTile(
                              title: 
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(value.category),
                              ),
                              subtitle: Wrap(
                                children: [ 
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(value.skills),
                                      )
                                    )
                                      
      
                                  ),
                                  
                                ]
                              ),
                              contentPadding: EdgeInsets.all(10.0),
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
