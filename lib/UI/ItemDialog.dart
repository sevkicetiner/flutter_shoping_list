import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _itemName;

  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      title: Text("Add your shopping item."),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Form(
                child:  TextFormField(
                  autofocus: true,
                  maxLength: 50,
                  onSaved: (value)=> _itemName = value,
                  validator: (value){
                    if(value.isEmpty){
                      return "validation error";
                    }
                    return null;
                  },
                ),
                key: _formKey,
              ),
              SizedBox(height: 20,),
              FlatButton(
                color: Theme.of(context).accentColor,
               child: Text("Add new item to shopping list."),
                onPressed: _saveForm,
              )
            ],
          ),
        )
      ],
    );
  }

  void _saveForm() {
    _formKey.currentState.save();
    if(_formKey.currentState.validate()){
      Navigator.pop(context, _itemName);
    }
  }
}
