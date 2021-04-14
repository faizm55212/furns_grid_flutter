import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color(0xFF000000),
                  ),
                  Positioned(
                    top: -200.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        color: Color(0xFFE2E2E2).withOpacity(0.3),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -150,
                    left: 150.0,
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(0xFFB3B1B1).withOpacity(0.3),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Shopping Cart',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      shoppingCard(true, context),
                      shoppingCard(false, context),
                      shoppingCard(true, context),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 15.0),
                        child: Text(
                          'Pick of the week',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF606060),
                          ),
                        ),
                      ),
                      pickCard(),
                      pickCard(),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ],
              )
            ]),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Material(
                          color: Colors.grey.withOpacity(0),
                          child: Icon(
                            Icons.lens,
                            color: Colors.grey.withOpacity(0),
                            size: 10.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'All Selection',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 300,
                    ),
                    Text(
                      'Total: \$5000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF432A)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, right: 10, bottom: 10, left: 10),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Text(
                          'Settlement',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget pickCard() {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
    child: Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/images/sofa3.jpg')),
        ),
        height: 150.0,
        width: double.infinity,
      ),
    ),
  );
}

@override
Widget shoppingCard(bool isFavorite, context) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
    child: Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        height: 100.0,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Center(
                child: isFavorite
                    ? Material(
                        color: Colors.grey.withOpacity(0),
                        child: Icon(
                          Icons.lens,
                          color: Colors.grey.withOpacity(0),
                          size: 10.0,
                        ),
                      )
                    : Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFF432A),
                        elevation: 2.0,
                        child: Icon(
                          Icons.lens,
                          color: Color(0xFFFF432A),
                          size: 10.0,
                        ),
                      ),
              ),
            ),
            Container(
              width: 120.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ottoman.jpg')),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Fin Navian',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'color : grey',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '\$200',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24.0,
                    color: Color(0xFFFF432A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 310,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  'x1',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
