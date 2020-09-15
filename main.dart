import 'package:flutter/material.dart';
import 'package:formValidator/order.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _formStateKey = GlobalKey();
  Order order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'item required' : null;
  }

  String _validateItemCount(String value) {
    int _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);

    return _valueAsInteger == 0 ? 'Atleast one item is required' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validator')),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidate: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value) => order.item = value,
                      validator: (value) => _validateItemRequired(value),
                      decoration: InputDecoration(
                        hintText: "Egg",
                        labelText: "enter your choice",
                      ),
                    ),
                    TextFormField(
                      onSaved: (value) => order.quantity = int.tryParse(value),
                      validator: (value) => _validateItemCount(value),
                      decoration: InputDecoration(
                        hintText: '5',
                        labelText: 'Quantity',
                      ),
                    ),
                    Divider(thickness: 10,),
                    RaisedButton(
                      child: Text("Save"),
                      onPressed: null)
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
