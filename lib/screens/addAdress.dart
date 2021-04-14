import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: SizedBox(
                            width: 30.0,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Text(
                          'Add New Address',
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ToggleSwitch(),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'set as default address',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey.withOpacity(0.5)),
                          ),
                        ),
                        TextField(
                          text: 'Contact No',
                          hintText: '9825xxxx25',
                        ),
                        TextField(
                          text: 'Recipient',
                          hintText: 'Enter Your Name',
                        ),
                        TextField(
                          text: 'Area',
                          hintText: 'Locality',
                        ),
                        TextField(
                          text: 'Address',
                          hintText: 'Enter Address',
                        ),
                        TextField(
                          text: 'Pincode',
                          hintText: 'Enter your pincode',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Text('Set label'),
                            Container(height: 70.0, child: CustomRadio()),
                          ],
                        ),
                        Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: ElevatedButton(
                              elevation: 2.0,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: <Color>[
                                      Color(0xFFFF5D5D),
                                      Color(0xFF9C0101),
                                      Color(0xFF630700),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          40.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Save and use',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String text;
  final String hintText;
  const TextField({
    this.hintText,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF707070),
              fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
        Container(
          height: 40.0,
          child: TextFormField(
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: Colors.yellow,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 5.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xE3E3E3E3),
                  width: 2.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xE3E3E3E3),
                  width: 2.0,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xFF9E9D9D),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

class CustomRadio extends StatefulWidget {
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  List<RadioModel> radioData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    radioData.add(new RadioModel(true, 'Home'));
    radioData.add(new RadioModel(false, 'Company'));
    radioData.add(new RadioModel(false, 'School'));
    radioData.add(new RadioModel(false, 'Other'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: radioData.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              radioData.forEach((element) => element.isSelected = false);
              radioData[index].isSelected = true;
            });
          },
          child: RadioItem(radioData[index]),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: _item.isSelected ? 0 : 1,
            child: Container(
              height: 30.0,
              width: 70.0,
              child: Center(
                child: Text(_item.buttonText,
                    style: TextStyle(
                      color:
                          _item.isSelected ? Colors.white : Color(0xFF9E9D9D),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              decoration: BoxDecoration(
                  color: _item.isSelected ? Color(0xFFFF3D3D) : Colors.white,
                  border: Border.all(
                      width: 1.0,
                      color: _item.isSelected
                          ? Color(0xFFDA2020)
                          : Colors.transparent),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 10.0),
          //   child: Text(_item.text),
          // )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}

class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Switch(
        value: _isSwitched,
        onChanged: (value) {
          setState(() {
            _isSwitched = value;
          });
        },
        activeColor: Color(0xFFFF0000),
        inactiveThumbColor: Color(0xFFFF0000),
      ),
    );
  }
}
