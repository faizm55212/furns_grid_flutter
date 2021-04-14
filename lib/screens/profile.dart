import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furns_grid/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 70.0,
                                width: 70.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  border: Border.all(
                                    width: 2.0,
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/chris.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.0,
                                top: 5.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pino',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24.0,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '1726****55',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: Color(0xFFCECECE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            rowIcon('assets/svgs/favorite.svg', 'Favorites',
                                Colors.white, 20.0, Alignment.center),
                            rowIcon('assets/svgs/money-bag.svg', 'Wallet',
                                Colors.white, 25.0, Alignment.topCenter),
                            rowIcon('assets/svgs/big-magnifier-with-shine.svg',
                                'Footprint', null, 20.0, Alignment.center),
                            rowIcon('assets/svgs/coupon.svg', 'Coupon',
                                Colors.white, 25.0, Alignment.topCenter),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OptionTile('Pending Payment', '5',
                                  'assets/svgs/card.svg', null),
                              OptionTile('To be shipped', '5',
                                  'assets/svgs/printer.svg', null),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OptionTile('To be received', '5',
                                  'assets/svgs/delivery-truck.svg', null),
                              OptionTile('Return / replace', '5',
                                  'assets/svgs/return.svg', null),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ],
                ),
                ListTile(
                  xcolor: Colors.pink.withOpacity(0.1),
                  xtext: 'Gift Card',
                  xicon: 'gift-box',
                  onTap: () {
                    Navigator.pushNamed(context, '/Profile/addAddress');
                  },
                ),
                ListTile(
                  xcolor: Colors.orange.withOpacity(0.2),
                  xtext: 'Bank Card',
                  xicon: 'credit-card-back',
                ),
                ListTile(
                  xcolor: Colors.redAccent.withOpacity(0.1),
                  xtext: 'Replacement Code',
                  xicon: 'qr-code',
                  onTap: () {},
                ),
                ListTile(
                  xcolor: Colors.lightGreen.withOpacity(0.3),
                  xtext: 'Customer Support',
                  xicon: 'woman-with-headset',
                  icolor: Colors.green,
                  onTap: () {},
                ),
                ListTile(
                  xcolor: Colors.red.withOpacity(0.2),
                  xtext: 'Log Out',
                  xicon: 'arrow',
                  onTap: () {
                    context.read<AuthenticationServices>().signOut();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  final Color xcolor;
  final String xtext;
  final String xicon;
  final onTap;
  final icolor;
  const ListTile(
      {this.xcolor, this.xtext, this.xicon, this.onTap, this.icolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: xcolor,
                    ),
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/svgs/$xicon.svg',
                      color: icolor,
                      width: 20.0,
                      height: 20.0,
                    )),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    xtext,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String _decText;
  final String _itemCount;
  final String svgPath;
  final Color color;
  OptionTile(this._decText, this._itemCount, this.svgPath, this.color);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 120.0,
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                child: SvgPicture.asset(
                  svgPath,
                  color: color,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Text(
                _decText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 15.0),
              child: Text(
                _itemCount,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowIcon(icon, text, color, width, align) {
  return Column(
    children: [
      Container(
        height: 30,
        alignment: align,
        child: SvgPicture.asset(
          icon,
          color: color,
          width: width,
        ),
        decoration: BoxDecoration(),
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          color: Color(0xFFCECECE),
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
