import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Drawer()
    );
  }
}

class Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuDrawer();
  }
}

class MenuDrawer extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Menu Drawer"),
      ),
    );
  }
}