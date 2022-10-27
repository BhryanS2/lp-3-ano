import 'package:flutter/material.dart';

class CampoTextoNovo extends StatefulWidget {
  const CampoTextoNovo({Key? key}) : super(key: key);

  @override
  State<CampoTextoNovo> createState() => _CampoTextoNovoState();
}

class _CampoTextoNovoState extends State<CampoTextoNovo> {
  TextEditingController _valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAddress, datetime
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite um valor"),
              //enabled: false,
              //maxLength: 2,
              //maxLengthEnforced: false,
              style: TextStyle(fontSize: 50, color: Colors.green),
              //obscureText: true,
              /*
              onChanged: (String texto){
                print("valor digitado:" +  texto);
              },*/
              onSubmitted: (String texto) {
                print("valor digitado:" + texto);
              },
              controller: _valor,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: () {
              print("valor digitado:" + _valor.text);
            },
          )
        ],
      ),
    );
  }
}
