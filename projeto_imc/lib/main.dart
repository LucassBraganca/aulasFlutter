import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: new Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controlePeso = TextEditingController();
  TextEditingController controleAltura = TextEditingController();
  String _info = "Informe os dados";

  void _resetar(){
    controleAltura.text = controlePeso.text = "";
    setState(() {
      _info = "Informe os dados";
    });
  }

  void calculaIMC(){ //Validar os dados

    setState(() {
      double peso = double.parse(controlePeso.text);
      double altura = double.parse(controleAltura.text)/100;

      double imc = peso/pow(altura,2);

      if(imc < 18.6){
        _info = "Abaixo do peso. IMC de ${imc.toStringAsPrecision(3)}";
      }
      else _info = "Não está abaixo do peso";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: (){_resetar;},)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, color: Colors.green, size: 120.0),
              TextField(keyboardType: TextInputType.number,
                controller: controlePeso,
                decoration: InputDecoration(
                    labelText: "Peso em Kg:",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
              TextField(keyboardType: TextInputType.number,
                controller: controleAltura,
                decoration: InputDecoration(
                    labelText: "Altura em cm:",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: (){calculaIMC;},
                    child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  ),
                ),
              ),
              Text(_info,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25))
            ],
          )
      )
    );
  }
}
