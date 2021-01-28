import 'package:flutter/material.dart';
import 'custom_icons_icons.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedTab, this.tabPressed});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 30.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabBtn(
              iconPath: CustomIcons.factory_icon,
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.timer,
              selected: _selectedTab == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.shopping_cart,
              selected: _selectedTab == 2 ? true : false,
              onPressed: () {
                widget.tabPressed(2);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.person_outline,
              selected: _selectedTab == 3 ? true : false,
              onPressed: () {
                widget.tabPressed(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconPath;
  final bool selected;
  final Function onPressed;
  BottomTabBtn({this.iconPath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _selected
                  ? Theme.of(context).accentColor
                  : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Icon(
          iconPath,
          size: 22.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
