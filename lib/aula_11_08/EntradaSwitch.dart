import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          //só pode ser executado em colunas
          SwitchListTile(
            //posso utilizar outras configuracoes vistas anteriormente: cor, etc
            title: const Text("Receber notificações?"),
            value: _escolhaUsuario,
            onChanged: (bool valor) {
              setState(() {
                _escolhaUsuario = valor;
              });
            },
          ),
          MaterialButton(
            onPressed: () {
              if (kDebugMode) {
                print(_escolhaUsuario
                    ? "escolha: ativar notificações"
                    : "escolha: NÃO ativar notificações");
              }
            },
            color: Colors.blue,
            child: const Text(
              "Salvar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          /*
          Switch(
              value: _escolhaUsuario,
              onChanged: (bool valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              }
          ),
          Text("Receber notificações?")
          */
        ],
      ),
    );
  }
}
