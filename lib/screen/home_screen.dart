import 'package:flutter/material.dart';
import 'package:soccerflutter/screen/touranments_screen.dart';
 
class HomeScreen extends StatefulWidget {

  @override
  _homeScreenState createState() => _homeScreenState();}

class _homeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final screen=[
    TouranmentScreen(),
    Center(child: Text("business"),),
    Center(child: Text("business"),),
    Center(child: Text("business"),)
  ];
 
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(     
      body: IndexedStack(
        index: _selectedIndex,
        children: screen,
        ),
      bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       backgroundColor: Colors.blue,
       selectedFontSize: 20,  
       unselectedItemColor: Colors.white,
       items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {   
          
    setState(() {
      _selectedIndex=value; 
     
    });
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[      
    Text(
      'Index 0: Home',
      style: optionStyle,     
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

}