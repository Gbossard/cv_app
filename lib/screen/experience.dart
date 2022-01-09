///
/// screen/experience.dart
///
import 'package:flutter/material.dart';

import 'package:cv_app/model/airtable_data.dart';
 
class ExperienceScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final AirtableData airtableData = AirtableData();
      return SingleChildScrollView(
         padding: const EdgeInsets.all(30),
      );
    }
}
