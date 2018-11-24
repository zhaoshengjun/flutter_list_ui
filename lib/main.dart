import 'package:flutter/material.dart';
import 'diagonal_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imageHeight = 256.0;
  Widget _buildImage() {
    return new Positioned.fill(
        bottom: null,
        child: new ClipPath(
          clipper: DiagonalClipper(),
          child: new Image.asset(
            'images/birds.jpg',
            fit: BoxFit.cover,
            height: _imageHeight,
            colorBlendMode: BlendMode.srcOver,
            color: new Color.fromARGB(120, 20, 10, 40),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[_buildImage()],
    ));
  }
}
