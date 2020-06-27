import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Models/user.dart';
import 'package:giftee/Pages/Funding_Subpages/new_funding.dart';
import 'package:giftee/Pages/Shared_Subpages/funding_page.dart';
import 'package:giftee/Shared/Alert/alert_auth.dart';
import 'package:giftee/Shared/size_config.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/fund/fund_fundings_item.dart';
import 'package:giftee/UI/standard_button.dart';
import 'package:provider/provider.dart';

class FundPage extends StatefulWidget {
  @override
  _FundPageState createState() => _FundPageState();
}

class _FundPageState extends State<FundPage>{
  final PageController _pageController = PageController(initialPage: 0);

  int _selectedIndex = 0;

  /////FOR TEST///////////////////
  String testUrl =
      'https://cdn.pocket-lint.com/r/s/970x/assets/images/147515-tablets-review-ipad-mini-review-2019-image1-y5aisrcjw9-jpg.webp';

  ////////////////////////////////

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: bgColor(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {

    final user = Provider.of<User>(context); /// Will be set using provider

    return Column(
      children: <Widget>[
        buttonStandard(
          outlined: false,
          title: 'New Crowd Funding',
          margin: EdgeInsets.all(15),
          borderRadius: 5,
          onPressed: user == null
              ? () => showLoginAlert(context)
              : () => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => NewFunding())
          ),
        ),
        Row(
          children: <Widget>[
            categoryButton(context, 'Ongoing', 0),
            categoryButton(context, 'My Funding', 1),
            categoryButton(context, 'Finished', 2)
          ],
        ),
        Expanded(
          child: PageView.builder(
              onPageChanged: (int index) =>
                  setState(() => _selectedIndex = index),
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int categoryIndex) {
                return SizedBox(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int fundingIndex) {

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: boxShadowStandard(),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: fundFundItem(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => FundingPage()
                              ));
                            },
                            height: 150,
                            mediaQueryWidth: SizeConfig.screenWidth,
                            categoryIndex: categoryIndex,
                            fundingIndex: fundingIndex
                        ),
                      );

                    },
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget categoryButton(context, String title, int index) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width / 3,
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(
              color:
              _selectedIndex == index ? selectedColor() : unselectedColor(),
              fontWeight: _selectedIndex == index ? FontWeight.bold : null),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn);
          });
        },
      ),
    );
  }
}
