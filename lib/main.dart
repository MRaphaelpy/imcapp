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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _result = "Informe seus Dados";

  void _reset() {
    pesoController.text = "";
    alturaController.text = "";
    _result = "Informe seus Dados";
  }

  void _calculed() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _result = "(${imc.toStringAsPrecision(3)}) Voce esta Abaixo do peso :(";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actions: [IconButton(onPressed: _reset, icon: Icon(Icons.refresh))],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
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
                controller: pesoController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite sua altura em (cm)",
                  labelStyle: TextStyle(color: Colors.purple, fontSize: 25.0),
                ),
                controller: alturaController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: _calculed,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: Colors.purple,
                  ),
                ),
              ),
              Text(
                "$_result",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
