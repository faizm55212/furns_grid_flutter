import 'package:flutter/material.dart';
import 'package:furns_grid/components/bottom-tabs.dart';
import 'package:furns_grid/components/row-tab.dart';
import 'package:furns_grid/components/cards.dart';
import 'package:flutter/services.dart';
import 'package:furns_grid/screens/shopping-cart.dart';
import 'package:furns_grid/screens/find-page.dart';
import 'package:furns_grid/screens/profile.dart';
import 'package:furns_grid/services/firebase_services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedTab = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomePage(),
                  FindPage(),
                  ShoppingCart(),
                  ProfilePage(),
                ],
              ),
            ),
            BottomTabs(
              selectedTab: _selectedTab,
              tabPressed: (num) {
                _pageController.animateToPage(num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _isSelectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  stackContainer(),
                  stackCircle1(),
                  stackCircle2(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15.0),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 15.0),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                  width: 2.0,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/chris.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 120.0),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                        SizedBox(height: 50.0),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Hello , Pino',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'What do you want to buy?',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCECECE)),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Color(0xFFFF432A), size: 30.0),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Quicksand'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Stack(
                children: [
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Material(
                        elevation: 2.0,
                        child: Container(height: 75.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RowTab(
                          isSelectedTab: _isSelectedTab,
                          tabPressed: (num) {
                            setState(() {
                              _isSelectedTab = num;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              FutureBuilder(
                  future: FirebaseServices().productsRef.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }

                    // Collection Data ready to display
                    if (snapshot.connectionState == ConnectionState.done) {
                      // Display the data inside a list view
                      return Column(
                        children: snapshot.data.docs.map<Widget>((document) {
                          return ItemCard(
                            title: document.data()['name'],
                            descp: document.data()['desc'],
                            imgPath: document.data()['imgUrl'][0],
                            isFavorite: document.data()['isFav'],
                          );
                        }).toList(),
                      );
                    }

                    // Loading State
                    return Container(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  Material highlightTab(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.transparent,
      shadowColor: Colors.grey.withOpacity(0),
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 95.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red.withOpacity(0.1),
            border: Border(
              bottom:
                  BorderSide(width: 2.0, color: Colors.red.withOpacity(0.4)),
              left: BorderSide(width: 2.0, color: Colors.red.withOpacity(0.4)),
              right: BorderSide(width: 2.0, color: Colors.red.withOpacity(0.4)),
              top: BorderSide(width: 2.0, color: Colors.red.withOpacity(0.4)),
            )),
      ),
    );
  }

  Positioned stackCircle2() {
    return Positioned(
      bottom: 100.0,
      left: 150.0,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          color: Color(0xFFB3B1B1).withOpacity(0.3),
        ),
      ),
    );
  }

  Positioned stackCircle1() {
    return Positioned(
      bottom: 50.0,
      right: 100.0,
      child: Container(
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Color(0xFFE2E2E2).withOpacity(0.3),
        ),
      ),
    );
  }

  Container stackContainer() {
    return Container(
      height: 250.0,
      width: double.infinity,
      color: Color(0xFF000000),
    );
  }
}
