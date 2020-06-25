import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/home_products_list.dart';

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
          ProductsList(
            title: Text('카테고리 별 상품'),
          ),
          ProductsList(
            title: Text('연령 별 상품'),
          ),
          ProductsList(
            title: Text('추천 상품'),
          )
        ],
      ),
    );
  }
}
