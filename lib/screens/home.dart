import 'package:dwmgex/exercices/exo1.dart';
import 'package:dwmgex/exercices/exo4.dart';
import 'package:dwmgex/exercices/exo5.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = 'STAR MOVIE'}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = <Widget>[
    CarouselImages(),
    WindowsLogo(),
    SafeArea(
        child: GestureDetector(
      onDoubleTap: () => print('Click'),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 80,
            width: 80,
            color: Colors.red,
          ),
        ],
      ),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 69, 1),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: _widgets[_selectedIndex],
      ),
    
    );
  }
}