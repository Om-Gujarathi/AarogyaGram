import 'package:flutter/material.dart';


class InstagramNavigationBar extends StatefulWidget {
  @override
  _InstagramNavigationBarState createState() => _InstagramNavigationBarState();
}

class _InstagramNavigationBarState extends State<InstagramNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[    Text('Home'),    Text('Search'),    Text('Add'),    Text('Notifications'),    Text('Profile')  ];

  void _onItemTapped(int index) {
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}