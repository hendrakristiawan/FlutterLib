import 'package:flutter/material.dart';
import 'package:flutter_app_menu/DrawerMenu.dart';

void main() => runApp(new Menu());

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new ButtonMenu(),
    );
  }
}

class ButtonMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _buttonMenu();
  }

}

class _buttonMenu extends State<ButtonMenu> {
  static BuildContext _context;
  static StatelessWidget _screen = null;

  static void _nextScreen(){
    Navigator.push(_context, MaterialPageRoute(builder: (_context) => _screen));
  }

  static RaisedButton  raisedButton(String label,StatelessWidget screen){
    _screen = screen;

    return RaisedButton(
      onPressed: _nextScreen,
      textColor: Colors.white,
      color: Colors.greenAccent,
      padding: const EdgeInsets.all(8.0),
      child: new Text(label),
    );
  }

  Widget buttonSection = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        raisedButton("Menu Drawer", DrawerMenu())
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    _context = context;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Menu"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          buttonSection
        ],
      ),
    );
  }
}
