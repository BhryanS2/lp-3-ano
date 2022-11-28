import 'package:flutter/material.dart';
import 'helper/exemplo_helper.dart';
import 'model/exemplo_model.dart';
import './form.dart';

class Home extends StatefulWidget {
  dynamic _exemplo;
  Home({Key? key, Exemplo? exemplo}) : super(key: key) {
    if (exemplo != null) {
      _exemplo = exemplo;
    }
  }

  @override
  _HomeState createState() => _HomeState(exemplo: _exemplo);
}

class _HomeState extends State<Home> {
  _HomeState({Exemplo? exemplo}) {
    if (exemplo != null) {
      _textoController.text = exemplo.texto;
      _numeroController.text = exemplo.numero.toString();
      _dataController.text = exemplo.data;
      _radioValue = exemplo.radioValue;
      _selectValue = exemplo.selectValue;
      _imagem = exemplo.imagem;
      _slider = exemplo.slider;
      _switchValue = exemplo.switchValue;
      _checkboxValue = exemplo.checkboxValue;
    }
  }
  List<Exemplo> _exemplos = <Exemplo>[];
  // helper
  final ExemploHelper _exemploHelper = ExemploHelper();

  // int? id;
  // late String texto;
  // late int numero;
  // late DateTime data;
  // late double slider;
  // late bool switchValue;
  // late bool checkboxValue;
  // late int radioValue;
  // late String selectValue;
  // late String imagem;

  final TextEditingController _textoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  int _radioValue = 0;
  String _selectValue = 'Selecione';
  String _imagem = '';
  double _slider = 0.0;
  bool _switchValue = false;
  bool _checkboxValue = false;

  _recuperarExemplo() async {
    List exemplosRecuperados = await _exemploHelper.recuperarAnotacoes();
    List<Exemplo> listaTemporaria = <Exemplo>[];
    for (var item in exemplosRecuperados) {
      Exemplo exemplo = Exemplo(
          checkboxValue: _checkboxValue,
          data: _dataController.text,
          imagem: _imagem,
          numero: int.parse(_numeroController.text),
          radioValue: _radioValue,
          selectValue: _selectValue,
          slider: _slider,
          switchValue: _switchValue,
          texto: _textoController.text,
          id: item["id"]);
      listaTemporaria.add(exemplo);
    }
    setState(() {
      _exemplos = listaTemporaria;
    });
  }

  void _showDialogMessage(String message) async {
    await Future.delayed(const Duration(seconds: 0));

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  _removerExemplo(int? id) async {
    if (id == null) {
      _showDialogMessage("Erro ao remover exemplo");
      return;
    }
    await _exemploHelper.removerExemplo(id);
    _showDialogMessage("Exemplo removido com sucesso");
    _recuperarExemplo();
  }

  @override
  void initState() {
    super.initState();
    _recuperarExemplo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Exemplos"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _exemplos.length,
                  itemBuilder: (context, index) {
                    final exemplo = _exemplos[index];
                    return Card(
                      child: ListTile(
                        title: Text(exemplo.texto),
                        subtitle: Image.asset(exemplo.imagem),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // navegar para a tela de atualizar
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Formulario(exemplo: exemplo),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerExemplo(exemplo.id);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Formulario(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
