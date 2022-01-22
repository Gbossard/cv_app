///
/// screen/profil.dart
///
import 'package:cv_app/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cv_app/widget/icoLink.dart';

import 'package:cv_app/model/airtable_data_profil.dart';
 
class ProfilScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return Scaffold(
        appBar: AppBar(
          title: Text("Gaëlle Bossard"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget> [
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/photo-gaelle.jpg'),
                  maxRadius: 50,
                  backgroundColor: Colors.teal,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icoLink(FontAwesomeIcons.instagram, "https://www.instagram.com/gaelle.photovideo/", Colors.grey.shade900),
                    icoLink(FontAwesomeIcons.linkedin, "https://fr.linkedin.com/in/ga%C3%ABlle-bossard", Colors.grey.shade900),
                  ],
                ),
              ),
              Container(  
                height: 300,
                child: FutureBuilder(
                  future: airtableData.getProfil(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                    if (snapshot.hasData) {
                      List<AirtableDataProfil>? values = snapshot.data;
                      return ListView(
                        children: values!
                            .map(
                              (AirtableDataProfil value) => ListTile(
                                leading: Text(
                                  value.icon,
                                  style:
                                      const TextStyle(fontFamily: 'MaterialIcons', fontSize: 18),
                                ),
                                title: Text(value.content),
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
        )
      );
    }
}