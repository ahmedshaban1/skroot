import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/master_page/master_page.dart';

import 'account/account_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    _index = 0;
    super.initState();
  }

  List<Widget> _pages = [
    MasterPage(),
    MasterPage(),
    MasterPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:_pages[_index] ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,

        onTap: (index){
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index ,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.white , fontSize: 14),
        iconSize: 30,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home) , title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket) , title: Text("Basket")),
          BottomNavigationBarItem(icon: Icon(Icons.notifications) , title: Text("Notify")),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("Account")),
        ],
      ),
    );
  }
}
