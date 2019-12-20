import 'package:flutter/material.dart';
import 'package:flutter_shoping_list/UI/ItemDialog.dart';


class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {

    int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String itemName = await showDialog(context: context, builder: (BuildContext context){
            return ItemDialog();
          });
          print(itemName);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title:  Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("list")),
          BottomNavigationBarItem(icon: Icon(Icons.history), title: Text("history"))
        ],
        onTap: _onTab,
        currentIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.cyan,
          )
        ],
      ),
    );
  }

  void _onTab(int value) {
    setState(() {
      _selectedIndex = value;
    });

    _pageController.jumpToPage(value);
  }
}
