///
/// widget/appBar.dart
///
import 'package:flutter/material.dart';

import 'package:cv_app/widget/icoLink.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar appBar(String title){
  return AppBar(
      title: Text(title),
      actions: [
        icoLink(FontAwesomeIcons.instagram, "https://www.instagram.com/gaelle.photovideo/", Colors.grey[50]),
        icoLink(FontAwesomeIcons.linkedin, "https://fr.linkedin.com/in/ga%C3%ABlle-bossard", Colors.grey[50]),  
      ],
    );
}
