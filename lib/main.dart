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
    return new MenuButton();
  }

}

class MenuButton extends State<ButtonMenu> {
  static BuildContext _context;
  static StatefulWidget _screen;

  static void _nextScreen(){
    Navigator.push(_context, MaterialPageRoute(builder: (_context) => _screen));
  }

  static Column  raisedButton(String label,StatefulWidget screen){
    _screen = screen;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(5.0))),
            onPressed: _nextScreen,
            textColor: Colors.white,
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(8.0),
            child: new Text(label),
          ),
        )
      ],
    );
  }

  Widget buttonSection = Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        raisedButton("Menu Drawer", DrawerMenu()),
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
