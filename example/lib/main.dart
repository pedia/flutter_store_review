import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store_review/flutter_store_review.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('StoreReviewPlugin Example'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () {
              FlutterStoreReview.requestReview();
            },
            child: new Text('StoreReview'),
          ),
        ),
      ),
    );
  }
}
