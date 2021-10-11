import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline, size: 120.0, color: Colors.purple),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite seu peso em (Kg)",
              labelStyle: TextStyle(color: Colors.purple),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite sua altura em (cm)",
              labelStyle: TextStyle(color: Colors.purple, fontSize: 25.0),
            ),
          )
        ],
      ),
    );
  }
}
