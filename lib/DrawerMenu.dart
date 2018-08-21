import 'package:flutter/material.dart';
import 'DrawerItemModel.dart';

class DrawerMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuDrawer();
  }
}

class MenuDrawer extends State<DrawerMenu> {
  int _selectedIndex = 0;

  final drawerItems = [
    new DrawerItemModel("Home",Icons.home),
    new DrawerItemModel("Profile",Icons.person),
    new DrawerItemModel("Notification", Icons.notifications),
    new DrawerItemModel("Setting",Icons.settings)
  ];

//  _getDrawerItem(int selectedIndex) {
//    return
//  }

   _onSelectItem(int i) {
    setState((){
      _selectedIndex = i;
//      _getDrawerItem(i);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions =[];

    for (var i = 0 ; i < drawerItems.length; i++){
      drawerOptions.add(new ListTile(
        leading: new Icon(drawerItems[i].icon),
        title: new Text(drawerItems[i].title, style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400)),
        selected: i == _selectedIndex,
        onTap:() => _onSelectItem(i)
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Menu Drawer"),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text(
                    "Hendra Kristiawan",
                  style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),
                ),
                accountEmail: new Text(
                  "ighendrakristiawan@gmail.com",
                  style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),
                )
            ),
            new Column(
              children: drawerOptions,
            )
          ],
        ),
      ),
//      body: _getDrawerItem(_selectedIndex),
    );
  }
}
