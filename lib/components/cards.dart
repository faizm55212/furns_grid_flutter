import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String? title;
  final String? imgPath;
  final String? descp;
  final bool? isFavorite;

  ItemCard({this.title, this.imgPath, this.descp, this.isFavorite});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/ProductPage');
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            height: 150.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 130.0,
                  height: 130.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('$imgPath'), fit: BoxFit.cover)),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width / 3) * 1.5,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              title!,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 45.0),
                          Container(child: Fav(isFavorite: isFavorite)),
                        ],
                      ),
                      SizedBox(height: 11.0),
                      Container(
                        // width: 175.0,
                        height: 49.0,
                        child: Text(
                          descp!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.grey,
                              fontSize: 12.0,
                              height: 1.4),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 10.0,
                          ), //Sudo Container
                          Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: .0),
                                Container(
                                  height: 40.0,
                                  width: 50.0,
                                  color: Color(0xFFFF432A),
                                  child: Center(
                                    child: Text(
                                      '\$248',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  width: 100.0,
                                  color: Color(0xFF000000),
                                  child: Center(
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
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

class Fav extends StatefulWidget {
  Fav({this.isFavorite});
  final bool? isFavorite;

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  bool? isFav;
  @override
  void initState() {
    isFav = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, right: 10.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isFav = isFav == false ? true : false;
            });
          },
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: isFav! ? Colors.white : Colors.grey.withOpacity(0.2)),
            child: Center(
              child: isFav!
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20.0,
                    )
                  : Icon(
                      Icons.favorite_border,
                      size: 20.0,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
