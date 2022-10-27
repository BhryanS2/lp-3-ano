import 'package:app/aula_1_09/FormData.dart';
import 'package:app/aula_1_09/TelaSecundaria.dart';
import 'package:app/projeto_1_9/Home.dart';
import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  bool? _isAgreeTerms = false;
  bool _isAgreeNotifications = false;
  int? _selectedRadio = 0;
  double _age = 0;

  List fieldsValues = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Entre seu nome',
              labelText: 'Nome',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite seu nome';
              }
              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'name': value,
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enrte com Telefone',
              labelText: 'Telefone',
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite seu telefone';
              }
              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'phone': value,
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Entre com sua data de nascimento',
              labelText: 'Data de Nascimento',
            ),
            keyboardType: TextInputType.datetime,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite sua data de nascimento';
              }
              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'date': value,
              });
            },
            onChanged: (value) => _age = DateTime.parse(value)
                    .difference(
                      DateTime.now(),
                    )
                    .inDays /
                365,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Entre com seu email',
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite seu email';
              }
              const regex =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              final RegExp regExp = RegExp(regex);
              if (!regExp.hasMatch(value)) {
                return 'Por favor, digite um email válido';
              }

              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'email': value,
              });
            },
          ),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Entre com sua senha',
              labelText: 'Senha',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite sua senha';
              }
              final digitPattern = RegExp(r'(\d+)');
              final isLowerCase = RegExp(r'[a-z]+');
              final isUpperCase = RegExp(r'[A-Z]+');

              if (!digitPattern.hasMatch(value)) {
                return 'Por favor, digite uma senha com pelo menos um dígito';
              }

              if (!isLowerCase.hasMatch(value)) {
                return 'Por favor, digite uma senha com pelo menos uma letra minúscula';
              }

              if (!isUpperCase.hasMatch(value)) {
                return 'Por favor, digite uma senha com pelo menos uma letra maiúscula';
              }

              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'password': value,
              });
            },
          ),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Confirme sua senha',
              labelText: 'Confirmar Senha',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, digite sua senha';
              }
              return null;
            },
            onSaved: (value) {
              fieldsValues.add({
                'passwordConfirmation': value,
              });
            },
          ),
          // termos de uso
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CheckboxListTile(
              title: const Text("Aceito os termos de uso"),
              value: _isAgreeTerms,
              onChanged: (bool? value) {
                setState(() {
                  _isAgreeTerms = value;
                });
              },
            ),
          ),
          // notificações
          SwitchListTile(
            title: const Text("Aceito receber notificações"),
            value: _isAgreeNotifications,
            onChanged: (bool valor) {
              setState(() {
                _isAgreeNotifications = valor;
              });
            },
          ),
          // qual o sexo
          Column(
            children: <Widget>[
              // radios
              RadioListTile(
                title: const Text("Masculino"), //titulo da lista
                value: 1, //tipo do valor do campo
                groupValue: _selectedRadio, // tipo do grupo
                onChanged: (int? escolha) {
                  setState(() {
                    _selectedRadio = escolha;
                  });
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: _selectedRadio,
                onChanged: (int? escolha) {
                  setState(() {
                    _selectedRadio = escolha;
                  });
                },
                title: const Text("Feminino"),
              ),
              RadioListTile(
                value: 3,
                groupValue: _selectedRadio,
                onChanged: (int? escolha) {
                  setState(() {
                    _selectedRadio = escolha;
                  });
                },
                title: const Text("Outro"),
              ),
            ],
          ),

          // slider - idade
          Text("Qual a sua idade?"),
          Slider(
            value: _age.toDouble(),
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: '${_age.round()}',
            onChanged: (double valor) {
              setState(() {
                _age = valor;
              });
            },
          ),

          Container(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text('Enviar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var dataToSubmit = {
                      _isAgreeNotifications,
                      _isAgreeTerms,
                      _selectedRadio,
                      fieldsValues
                    };
                    // print("Data to submit: $dataToSubmit");
                    // print(dataToSubmit);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormData(
                          dataRecieved: fieldsValues,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
