import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:furns_grid/custom_icons_icons.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with TickerProviderStateMixin {
  TabController rController;
  @override
  void initState() {
    super.initState();

    rController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    rController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Stack(
                  // alignment: Alignment.bottomCenter,
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
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                iconSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, top: 40.0),
                          child: Text(
                            'Find',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        TabBar(
                          isScrollable: true,
                          controller: rController,
                          indicatorColor: Colors.white,
                          tabs: <Widget>[
                            TabButtons('Collection'),
                            TabButtons('Shop'),
                            TabButtons('Recommend'),
                            TabButtons('Activity'),
                            TabButtons('Fashion'),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FindCard(
                            title: 'Finn Navian',
                            subTime: 'Just Now',
                            discp: 'We hope to surprise you',
                            intViews: 1441,
                            isFavorite: false),
                        FindCard(
                            title: 'Finn Navian',
                            subTime: 'Just Now',
                            discp: 'We hope to surprise you',
                            intViews: 1441,
                            isFavorite: false),
                        FindCard(
                            title: 'Finn Navian',
                            subTime: 'Just Now',
                            discp: 'We hope to surprise you',
                            intViews: 1441,
                            isFavorite: false),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabButtons extends StatelessWidget {
  final String _text;
  const TabButtons(this._text);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 15.0,
          color: Color(0xFFCECECE),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class FindCard extends StatelessWidget {
  final String title;
  final String subTime;
  final IconData mIcon;
  final String discp;
  final int intViews;
  final bool isFavorite;
  const FindCard(
      {this.title,
      this.subTime,
      this.mIcon,
      this.discp,
      this.intViews,
      this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5.0,
        child: Container(
          height: 250.0,
          width: MediaQuery.of(context).size.width - 30.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 40,
                      width: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subTime,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(discp),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 2.0,
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 2.0,
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$intViews views',
                      style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                    Fav(
                      isFavorite: isFavorite,
                    )
                  ],
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
  final bool isFavorite;

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  bool isFav;
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
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                color: isFav ? Colors.white : Colors.grey.withOpacity(0.2)),
            child: Center(
              child: isFav
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 15.0,
                    )
                  : Icon(
                      Icons.favorite_border,
                      size: 15.0,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
