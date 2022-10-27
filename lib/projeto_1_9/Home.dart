import 'package:flutter/material.dart';

import 'TelaCliente.dart';
import 'TelaServico.dart';
import 'TelaEmpresa.dart';
import 'TelaContato.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirEmpresa() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TelaEmpresa())); //fazer import
  }

  void _abrirServico() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TelaServico())); //fazer import
  }

  void _abrirCliente() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TelaCliente())); //fazer import
  }

  void _abrirContato() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TelaContato())); //fazer import
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //cor branca de fundo no app
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green, //cor da barra
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //alinhamento da coluna
          mainAxisAlignment: MainAxisAlignment.center, //alinhamento da coluna
          children: <Widget>[
            Image.asset("assets/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //alinhamento da linha
                children: <Widget>[
                  GestureDetector(
                    //evento de clicar em cima da imagem
                    onTap: _abrirEmpresa,
                    child: Image.asset("assets/menu_empresa.png"),
                  ),
                  GestureDetector(
                    //evento de clicar em cima da imagem
                    onTap: _abrirServico,
                    child: Image.asset("assets/menu_servico.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //alinhamento da linha
                children: <Widget>[
                  GestureDetector(
                    //evento de clicar em cima da imagem
                    onTap: _abrirCliente,
                    child: Image.asset("assets/menu_cliente.png"),
                  ),
                  GestureDetector(
                    //evento de clicar em cima da imagem
                    onTap: _abrirContato,
                    child: Image.asset("assets/menu_contato.png"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
