import '../helper/exemplo_helper.dart';

class Exemplo {
  // int? id;
  // String nome;
  // String cnpj;
  // String telefone;

  // Fornecedor(this.nome, this.cnpj, this.telefone, {this.id});
//   1.1. Texto
// - [] 1.2. Número
// - [] 1.3. Data
// - [] 1.4. slider
// - [] 1.5. Switch
// - [] 1.6. Checkbox
// - [] 1.7. Radio
// - [] 1.8. Select
// - [] 1.9. Imagem
  int? id;
  late String texto;
  late int numero;
  late String data;
  late double slider;
  late bool switchValue;
  late bool checkboxValue;
  late int radioValue;
  late String selectValue;
  late String imagem;

  Exemplo({
    required this.texto,
    required this.numero,
    required this.data,
    required this.slider,
    required this.switchValue,
    required this.checkboxValue,
    required this.radioValue,
    required this.selectValue,
    required this.imagem,
    this.id,
  });

  Map toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'texto': texto,
      'numero': numero,
      'data': data.toString(),
      'slider': slider,
      'switchValue': switchValue,
      'checkboxValue': checkboxValue,
      'radioValue': radioValue,
      'selectValue': selectValue,
      'imagem': imagem,
    };

    if (id != null) {
      //so retorna com id se ele existir
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map) {
    return Exemplo(
      id: map["id"],
      texto: map["texto"],
      numero: map["numero"],
      data: map["data"],
      slider: map["slider"],
      switchValue: map["switchValue"],
      checkboxValue: map["checkboxValue"],
      radioValue: map["radioValue"],
      selectValue: map["selectValue"],
      imagem: map["imagem"],
    );
  }
}
