import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:percent_indicator/percent_indicator.dart';

String testUrl = 'https://cdn.pocket-lint.com/r/s/970x/assets/images/147515-tablets-review-ipad-mini-review-2019-image1-y5aisrcjw9-jpg.webp';

Widget fundFundItem ({
  @required Function onPressed,
  @required double height,
  @required double mediaQueryWidth,
  @required int categoryIndex,
  @required int fundingIndex

})
{
  double w = mediaQueryWidth - 20; //padding of 20
  return SizedBox(
    width: mediaQueryWidth,
    height: height,
    child: InkWell(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          SizedBox(
              width: w * 0.3,
              child: Image.network(
                testUrl,
                fit: BoxFit.fitHeight,
              )
          ),
          SizedBox(
            width: w * 0.05,
          ),
          SizedBox(
            width: w * 0.65,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.05),
                  height: height * 0.2,
                  child: Text(
                    'Funding category $categoryIndex funding $fundingIndex aslofdjasoiuehrqwoieuchoqwiuecrnhoiwh',
                    style: TextStyle(
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: height * 0.3,
                  child: Center(
                    child: Text(
                      'Explanations about Funding category $categoryIndex funding $fundingIndex asdfasdfasd',
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
                  height: height * 0.2,
                  child: Center(
                    child: LinearPercentIndicator(
                      progressColor: selectedColor(),
                      backgroundColor: unselectedColor(),
                      width: w * 0.6,
                      lineHeight: height * 0.1,
                      percent: 0.6,
                      center: Text("60.0%", style: TextStyle(color: Colors.white),),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
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
}