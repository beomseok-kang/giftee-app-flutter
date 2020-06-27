import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Pages/Shared_Subpages/complex_search.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/home/home_products_list.dart';
import 'package:giftee/UI/home/home_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        backgroundColor: selectedColor(),
        title: Text(
          'Giftee',
          style:
              TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          searchBar(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => ComplexSearchPage()
                ));
              }
          ),
          ProductsList(
            title: Text('Your Favorites', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          ProductsList(
            title: Text('Selection by Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          ProductsList(
            title: Text('Selection by Ages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
