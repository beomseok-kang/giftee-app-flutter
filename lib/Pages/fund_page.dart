import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Pages/Funding_Subpages/new_funding.dart';
import 'package:giftee/Pages/Shared_Subpages/funding_page.dart';
import 'package:giftee/Shared/size_config.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/standard_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FundPage extends StatefulWidget {
  @override
  _FundPageState createState() => _FundPageState();
}

class _FundPageState extends State<FundPage> {
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
    return Column(
      children: <Widget>[
        buttonStandard(
          outlined: false,
          title: 'New Crowd Funding',
          onPressed: () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => NewFunding())),
        ),
        Row(
          children: <Widget>[
            categoryButton(context, 'Ongoing', 0),
            categoryButton(context, 'My Funding', 1),
            categoryButton(context, 'Finished', 2)
          ],
        ),
        SizedBox(
          height: 20,
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
                  child: ListView.separated(
                    separatorBuilder: (context, int index) => Divider(
                      color: Colors.transparent,
                      height: 20,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int fundingIndex) {
                      double w = MediaQuery.of(context).size.width - 48;
                      double h = 150;

                      return SizedBox(
                        width: w,
                        height: h,
                        child: FlatButton(
                          onPressed: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FundingPage())),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                  width: w * 0.3,
                                  child: Image.network(
                                    testUrl,
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                width: w * 0.05,
                              ),
                              SizedBox(
                                width: w * 0.65,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: h * 0.3,
                                      width: w * 0.65,
                                      child: Center(
                                        child: Text(
                                          'Funding category $categoryIndex funding $fundingIndex',
                                          style: TextStyle(
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.bold),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.65,
                                      height: h * 0.3,
                                      child: Center(
                                        child: Text(
                                          'Explanations about Funding category $categoryIndex funding $fundingIndex',
                                          style: TextStyle(
                                            fontSize: w * 0.04,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.2,
                                      child: Center(
                                        child: LinearPercentIndicator(
                                          width: w * 0.6,
                                          lineHeight: h * 0.1,
                                          percent: 0.6,
                                          center: Text("60.0%"),
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.2,
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '600,000 / 1,000,000',
                                            style:
                                                TextStyle(fontSize: w * 0.035),
                                          ),
                                          Spacer(),
                                          Text(
                                            '6 days left',
                                            style:
                                                TextStyle(fontSize: w * 0.035),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
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
      width: MediaQuery.of(context).size.width / 3,
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
