import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowTab extends StatefulWidget {
  final int isSelectedTab;
  final Function(int) tabPressed;
  const RowTab({this.isSelectedTab, this.tabPressed});

  @override
  _RowTabState createState() => _RowTabState();
}

class _RowTabState extends State<RowTab> {
  int _isSelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _isSelectedTab = widget.isSelectedTab ?? 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RowTabBtn(
          isSelectedTab: _isSelectedTab == 0 ? true : false,
          xSvg: 'sofa.svg',
          xTitle: 'Sofas',
          onPressed: () {
            widget.tabPressed(0);
          },
        ),
        RowTabBtn(
          isSelectedTab: _isSelectedTab == 1 ? true : false,
          xSvg: 'closet.svg',
          xTitle: 'Wardrobe',
          onPressed: () {
            widget.tabPressed(1);
          },
        ),
        RowTabBtn(
          isSelectedTab: _isSelectedTab == 2 ? true : false,
          xSvg: 'desk.svg',
          xTitle: 'Desk',
          onPressed: () {
            widget.tabPressed(2);
          },
        ),
        RowTabBtn(
          isSelectedTab: _isSelectedTab == 3 ? true : false,
          xSvg: 'mirror.svg',
          xTitle: 'Dresser',
          onPressed: () {
            widget.tabPressed(3);
          },
        ),
      ],
    );
  }
}

class RowTabBtn extends StatelessWidget {
  final String xTitle;
  final String xSvg;
  final bool isSelectedTab;
  final Function onPressed;
  const RowTabBtn({this.isSelectedTab, this.xSvg, this.xTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = isSelectedTab ?? false;
    return GestureDetector(
      onTap: _selected ? null : onPressed,
      child: Material(
        elevation: _selected ? 5.0 : 0.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: _selected ? 95.0 : 75.0,
          width: MediaQuery.of(context).size.width / 5,
          child: Column(
            children: [
              SizedBox(height: 5),
              Container(
                height: 50.0,
                child: Center(
                    child: SvgPicture.asset(
                  'assets/svgs/$xSvg',
                  height: _selected ? 55.0 : 45.0,
                )),
              ),
              SizedBox(height: 2.0),
              Text(
                xTitle,
                style: TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.w700),
              ),
            ],
          ),
          decoration: _selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red.withOpacity(0.1),
                  border: Border(
                    bottom: BorderSide(
                        width: 2.0, color: Colors.red.withOpacity(0.4)),
                    left: BorderSide(
                        width: 2.0, color: Colors.red.withOpacity(0.4)),
                    right: BorderSide(
                        width: 2.0, color: Colors.red.withOpacity(0.4)),
                    top: BorderSide(
                        width: 2.0, color: Colors.red.withOpacity(0.4)),
                  ))
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
        ),
      ),
    );
  }
}
