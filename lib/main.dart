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

  GlobalKey<FormState> _formalKey = GlobalKey<FormState>();

  String _result = "Informe seus Dados";

  void _reset() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      _result = "Informe seus Dados";
      _formalKey = GlobalKey<FormState>();
    });
  }

  void _calculed() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _result = "(${imc.toStringAsPrecision(3)}) Voce esta Abaixo do peso :(";
      } else if (imc >= 18.6 && imc < 24.9) {
        _result =
            "(${imc.toStringAsPrecision(3)}) Voce esta No peso Ideal XD :(";
      } else if (imc >= 24.9 && imc < 29.9) {
        _result =
            "(${imc.toStringAsPrecision(3)}) Voce esta Levemente Acima do Peso :O";
      } else if (imc >= 29.9 && imc < 34.9) {
        _result = "(${imc.toStringAsPrecision(3)}) Obesidade Nivel I ";
      } else if (imc >= 39.9 && imc < 39.9) {
        _result = "(${imc.toStringAsPrecision(3)}) Obesidade Nivel II ";
      } else if (imc >= 40) {
        _result =
            "(${imc.toStringAsPrecision(3)})Extremo cuido voce esta com Obesidade Nivel III ";
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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person_outline, size: 120.0, color: Colors.purple),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Digite seu peso em (Kg)",
                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple, fontSize: 25.0),
                    controller: pesoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu peso";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Digite sua altura em (cm)",
                      labelStyle:
                          TextStyle(color: Colors.purple, fontSize: 25.0),
                    ),
                    controller: alturaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua Altura";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formalKey.currentState!.validate()) {
                            _calculed();
                          }
                        },
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
              key: _formalKey,
            )));
  }
}
