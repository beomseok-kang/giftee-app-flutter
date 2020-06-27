import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Models/user.dart';
import 'package:giftee/Pages/Authentication/login_page.dart';
import 'package:giftee/Pages/account_page.dart';
import 'package:giftee/Pages/fund_page.dart';
import 'package:giftee/Pages/home_page.dart';
import 'package:giftee/Pages/search_page.dart';
import 'package:giftee/Pages/wish_page.dart';
import 'package:giftee/Services/Auth/auth.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GifteeApp());
}

class GifteeApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
      ],
      child: MaterialApp(
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

    final user = Provider.of<User>(context); ///user

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
            title: Text('Home', style: TextStyle(fontSize: 12),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search', style: TextStyle(fontSize: 12),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites', style: TextStyle(fontSize: 12),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('Fundings', style: TextStyle(fontSize: 12),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account', style: TextStyle(fontSize: 12),)
          ),
        ],
      ),
    );
  }
}
