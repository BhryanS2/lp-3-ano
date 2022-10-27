import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  List dataRecieved;
  FormData({Key? key, required this.dataRecieved}) : super(key: key);
  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  List _data = [];
  void printData() {
    print(widget.dataRecieved);
    setState(() {
      _data = widget.dataRecieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados do Formulário"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Dados do Formulário"),
            MaterialButton(onPressed: printData, child: Text("Imprimir Dados")),
            // imprimir dados recebidos do formulário
            Text("${_data[0]['name']}"),
          ],
        ),
      ),
    );
  }
}
