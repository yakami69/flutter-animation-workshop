import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_animation/home/location_card.dart';
import 'package:flutter_workshop_animation/model/place_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);
  List<PlaceModel> placeList = PlaceModel.getDummyPlace();

  List<String> countryList = ["Dubai", "China", "Korea", "Nepal", "Japan"];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        selectedIndex.value = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f8f9),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 24, left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Asia",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.apps,
                  size: 32,
                )
              ],
            ),
          ),
          Container(
            height: 72,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 36, left: 32, right: 32),
              shrinkWrap: true,
              itemCount: countryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color:
                          index == 0 ? Color(0xff0246ff) : Color(0xffdee7fa)),
                  child: Center(
                    child: Text(
                      countryList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            children: _buildPages(),
          ))
        ],
      )),
      bottomNavigationBar: Container(
        height: 72,
        width: double.infinity,
        padding: EdgeInsets.only(top: 16, left: 32, right: 32),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Word",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(
                Icons.schedule,
                color: Colors.grey,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(
                Icons.local_library,
                color: Colors.grey,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(
                Icons.group,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _buildPages() {
    final List<Widget> pages = <Widget>[];
    double value = _pageController.hasClients ? _pageController.page : 0;
    for (int index = 0; index < placeList.length; index++) {
      double opacity = 1 - min((value - index).abs(), 1.0) * 0.8;
      double size = 1 - min((value - index).abs(), 1) * 0.2;
      pages.add(_buildPageItem(placeList[index], opacity, size));
    }
    return pages;
  }

  Widget _buildPageItem(PlaceModel location, double opacity, double size) {
    return Opacity(
      opacity: opacity,
      child: FractionallySizedBox(
        heightFactor: size,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xff9ce4fb),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: LocationCard(location),
        ),
      ),
    );
  }
}
