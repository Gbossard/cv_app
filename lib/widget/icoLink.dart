///
/// widget/icoLink.dart
///
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget icoLink(var _ico, String _url){
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      child: FaIcon(
        _ico,
        color: Colors.grey.shade900,
        size: 32,
      )
    ),
  );
}
