import 'package:flutter/material.dart';


class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget>_widgetOptions = <Widget>[
    Text('Map'), //Map(),
    Text('Profile'), //Profile()
    Text('About Us'), //AboutUs()
  ]; 

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Bottom Nav Bar"),
        ), //App Bar
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Map"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"),  
              
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "About Us"),

          ],
     currentIndex: _selectedIndex,
     onTap: _onItemTap,
      ), //BottomNavigationBar
      ); //Scaffold
  }
}


// This part should be added to main.dart to run this navbar. ****

// import 'package:flutter/material.dart';
// import 'package:tlydp/reusables/navbar/nav.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Bottom Nav Bar",
//       home: Nav(),

//     );
//   }
// }
