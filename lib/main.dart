import 'package:flutter/material.dart';

import 'UI/ShoppingListPage.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.white
      ),
      home: ShoppingListPage(),
    );
  }
}

