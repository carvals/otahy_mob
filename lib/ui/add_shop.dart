import 'package:flutter/material.dart';

class AddShop extends StatefulWidget {
  String store;

  AddShop({Key key, this.store}): super(key:key);

  @override
  _AddShopState createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Create a Shop'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
      
    );
  }
}

