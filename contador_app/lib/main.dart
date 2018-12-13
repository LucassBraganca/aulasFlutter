//Projeto de um simples contador de pessoas - 13/12/2018

import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "Contador",
    home: Home()
  ));
} //Fim da função main

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas = 0;

  void _mudou(int n){
    setState(() {
      _pessoas+=n;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("imagens/restaurant.jpg", fit: BoxFit.cover,
          height: 1000,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_pessoas",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("+1", style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: (){_mudou(1);}
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("-1", style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: (){_mudou(-1);}
                  ),
                ),
              ],
            ),
            Text("Pode entrar",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
