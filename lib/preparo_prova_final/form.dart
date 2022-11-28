import 'package:flutter/material.dart';
import './model/exemplo_model.dart';
import './helper/exemplo_helper.dart';
import './Home.dart';

class Formulario extends StatefulWidget {
  dynamic _exemplo = null;
  Formulario({Key? key, Exemplo? exemplo}) : super(key: key) {
    if (exemplo != null) {
      _exemplo = exemplo;
    }
  }

  @override
  _FormularioState createState() => _FormularioState(exemplo: _exemplo);
}

class _FormularioState extends State<Formulario> {
  final ExemploHelper _exemploHelper = ExemploHelper();
  final TextEditingController _textoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  int _radioValue = 0;
  String _selectValue = 'Selecione';
  String _imagem = '';
  double _slider = 0.0;
  bool _switchValue = false;
  bool _checkboxValue = false;
  bool _isEdit = false;

  _FormularioState({Exemplo? exemplo}) {
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
      _isEdit = true;
    }
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

  _salvarExemplo({Exemplo? exemplo}) async {
    if (!_isEdit || exemplo == null) {
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
        id: null,
      );
      int resultado = await _exemploHelper.salvarExemplo(exemplo);
      if (resultado == 0) {
        _showDialogMessage("Erro ao salvar exemplo");
      } else {
        _showDialogMessage("Exemplo salvo com sucesso");
      }

      // limpar campos
      setState(() {
        _textoController.text = "";
        _numeroController.text = "";
        _dataController.text = "";
        _radioValue = 0;
        _selectValue = 'Selecione';
        _imagem = '';
        _slider = 0.0;
        _switchValue = false;
        _checkboxValue = false;
      });

      return;
    }
    exemplo.checkboxValue = _checkboxValue;
    exemplo.data = _dataController.text;
    exemplo.imagem = _imagem;
    exemplo.numero = int.parse(_numeroController.text);
    exemplo.radioValue = _radioValue;
    exemplo.selectValue = _selectValue;
    exemplo.slider = _slider;
    exemplo.switchValue = _switchValue;
    exemplo.texto = _textoController.text;

    int resultado = await _exemploHelper.atualizarExemplo(exemplo);
    if (resultado == 0) {
      _showDialogMessage("Erro ao atualizar exemplo");
    } else {
      _showDialogMessage("Exemplo atualizado com sucesso");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalho - Bhryan Stepenhen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _textoController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Texto",
                  hintText: "Digite o texto",
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _numeroController,
                autofocus: false,
                decoration: const InputDecoration(
                  labelText: "Número",
                  hintText: "Digite o número",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _dataController,
                autofocus: false,
                decoration: const InputDecoration(
                  labelText: "Data",
                  hintText: "Digite a data",
                ),
                keyboardType: TextInputType.datetime,
              ),
              Slider(
                value: _slider,
                min: 0,
                max: 10,
                divisions: 10,
                label: _slider.toString(),
                onChanged: (double value) {
                  setState(() {
                    _slider = value;
                  });
                  // rebuild everything
                },
              ),
              SwitchListTile(
                title: const Text('Switch'),
                value: _switchValue,
                onChanged: (bool? value) {
                  setState(() {
                    _switchValue = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Checlbox'),
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
              ),
              const Text("Escolha um radio"),
              RadioListTile(
                title: const Text('Radio 1'),
                value: 0,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _radioValue = value;
                    });
                  }
                },
              ),
              RadioListTile(
                title: const Text('Radio 2'),
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _radioValue = value;
                    });
                  }
                },
              ),
              const Text("Escolha um select"),
              DropdownButton<String>(
                value: _selectValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectValue = newValue!;
                  });
                },
                items: <String>[
                  'Selecione',
                  'Opção 1',
                  'Opção 2',
                  'Opção 3',
                  'Opção 4',
                  'Opção 5',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Text("Escolha uma imagem"),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/cliente1.png'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _imagem = 'assets/cliente1.png';
                      });
                    },
                    child: const Text('Imagem 1'),
                  ),
                ],
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/cliente2.png'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _imagem = 'assets/cliente2.png';
                      });
                    },
                    child: const Text('Imagem 2'),
                  ),
                ],
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _imagem = 'assets/logo.png';
                      });
                    },
                    child: const Text('Imagem 3'),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    child: const Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      // salvar os dados
                      Exemplo exemplo = Exemplo(
                        imagem: _imagem,
                        slider: _slider,
                        switchValue: _switchValue,
                        checkboxValue: _checkboxValue,
                        data: _dataController.text,
                        numero: int.parse(_numeroController.text),
                        radioValue: _radioValue,
                        selectValue: _selectValue,
                        texto: _textoController.text,
                      );
                      if (_isEdit) {
                        _salvarExemplo();
                      } else {
                        _salvarExemplo(exemplo: exemplo);
                      }

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
