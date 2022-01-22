///
/// screen/device.dart
///
import 'package:flutter/material.dart';
import 'profil.dart';
import 'experience.dart';
import 'education.dart';
import 'skill.dart';
import 'info.dart';
 
/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}
 
/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;
 
  /// liste des écrans
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfoScreen(),
  ];
 
  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //
        onTap: onTabTapped,
        backgroundColor: Colors.teal,
        fixedColor: Colors.grey[50],
        unselectedItemColor: Colors.teal[200],
        //
        currentIndex: _currentScreen,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Expériences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'Compétences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Infos',
          )
        ],
      ),
    );
  }
 
  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}