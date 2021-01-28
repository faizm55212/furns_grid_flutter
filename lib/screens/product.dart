import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/images/ottoman.jpg',
    'assets/images/chair.jpg',
    'assets/images/sofa3.jpg',
    'assets/images/anotherchair.jpg',
  ];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : photos.length - 1;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                color: Colors.white.withOpacity(0.7),
                height: 335.0,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              elevation: 5.0,
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(photos[photoIndex]))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: _nextImage,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: _previousImage,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 315,
                          left: MediaQuery.of(context).size.width / 3.5,
                          bottom: 5.0),
                      child: Row(
                        children: <Widget>[
                          PhotoDots(photos.length, photoIndex),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 10.0),
                    child: Text(
                      'Aclide Number:  2323X',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      'Finn Navian-Sofa',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: (MediaQuery.of(context).size.width / 5) * 3.3,
                          height: 40.0,
                          child: Text(
                            'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          '\$ 248',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                    ),
                    child: Text(
                      'COLOUR',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                    ),
                    child: Row(children: [
                      Icon(
                        Icons.lens,
                        color: Colors.cyan,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.lens,
                        color: Colors.green,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.lens,
                        color: Colors.brown,
                        size: 40.0,
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 10.0,
                    ),
                    child: Text(
                      'MATERIAL',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 4.0,
          child: Container(
            height: 58.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5.0),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () {},
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  color: Colors.yellow,
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoDots extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  PhotoDots(this.numberOfDots, this.photoIndex);

  Widget _inActiveIndicator() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  Widget _activeIndicator() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.0,
                blurRadius: 2.0,
              )
            ]),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activeIndicator() : _inActiveIndicator());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDots(),
    );
  }
}
