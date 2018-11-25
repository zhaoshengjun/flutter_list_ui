import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'diagonal_clipper.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        clipper: new DiagonalClipper(),
        child: new Image.asset(
          'images/birds.jpg',
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return new Padding(
      padding:
          new EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 192.0),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.menu,
              size: 32.0,
              color: Colors.white,
            ),
            onPressed: () {
              // debugDumpLayerTree();
              // debugDumpRenderTree();
            },
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Text(
                "Timeline",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          new Icon(Icons.linear_scale, color: Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _buildImage(),
          _buildTopHeader(),
        ],
      ),
    );
  }
}
