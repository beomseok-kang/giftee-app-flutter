import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:giftee/Pages/Shared_Subpages/product_page.dart';

class ProductsList extends StatefulWidget {

  final Widget title;
  ////final List<Map> infoMap;
  ////infoMap: { category name : { product 1 : product info ... }}
  ProductsList({@required this.title});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  ////List<Map> infoMap;
  ////infoMap: { category name : { product 1 : product info ... }}

  int _selectedIndex = 0;

  ////////////////////////////////////
  double cardHeight = 250;
  double cardWidth = 200;
  ////////////////////////////////////

  /////FOR TEST///////////////////
  String testUrl = 'https://cdn.pocket-lint.com/r/s/970x/assets/images/147515-tablets-review-ipad-mini-review-2019-image1-y5aisrcjw9-jpg.webp';
  ////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20,),
        widget.title,
        SizedBox(height: 30,),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return FlatButton(
                color: Colors.transparent,
                child: Text('Category $index',
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                margin: EdgeInsets.only(right: 10),
                height: cardHeight,
                width: cardWidth,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => ProductPage()
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          width: cardWidth,
                          height: cardHeight * 0.5,
                          child: Image.network(testUrl, fit: BoxFit.fill,)
                      ),
                      SizedBox(
                        width: cardWidth,
                        height: cardHeight * 0.2,
                        child: Text(
                          'Product of Category $_selectedIndex product number $index',
                          style: TextStyle(
                            fontSize: cardWidth * 0.065,
                            fontWeight: FontWeight.bold,
                            height: cardHeight * 0.0065,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        height: cardHeight * 0.15,
                        child: Center(
                          child: Text(
                            '1,000,000 원',
                            style: TextStyle(
                              fontSize: cardWidth * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        height: cardHeight * 0.15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 10,),
                            RatingBarIndicator(
                              rating: 3.7,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: cardWidth * 0.07,
                            ),
                            Text(
                              '(3.7)',
                              style: TextStyle(
                                fontSize: cardWidth * 0.07,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '122',
                              style: TextStyle(
                                fontSize: cardWidth * 0.07,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              ' 리뷰',
                              style: TextStyle(
                                fontSize: cardWidth * 0.07,
                              ),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20,),
        Divider(thickness: 2, color: Colors.grey,)
      ],
    );
  }
}
