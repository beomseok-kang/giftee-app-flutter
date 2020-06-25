import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Pages/Authentication/login_page.dart';
import 'package:giftee/Pages/account_page.dart';
import 'package:giftee/Pages/fund_page.dart';
import 'package:giftee/Pages/home_page.dart';
import 'package:giftee/Pages/search_page.dart';
import 'package:giftee/Pages/wish_page.dart';
import 'package:giftee/Shared/style_standard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giftee',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
        color: bgColor(),
        child: SafeArea(
          child: MainPage()
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  List<Widget> pages = [HomePage(), SearchPage(), WishPage(), FundPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {

    dynamic user; ///user

    return Scaffold(
      backgroundColor: bgColor(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: appBarColor(),
        onTap: (index) {
          setState(() {
            if(index == 4 && user == null) {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) => LoginPage()
              ));
            } else {
              _selectedIndex = index;
            }
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: selectedColor(),
        unselectedItemColor: unselectedColor(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('Fundings')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account')
          ),
        ],

      ),
    );
  }
}
