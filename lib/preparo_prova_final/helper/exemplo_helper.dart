import '../model/exemplo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ExemploHelper {
  static const String nomeTabela = 'exemplo';

  static final ExemploHelper _exemploHelper = ExemploHelper._internal();
  Database? _db;

  factory ExemploHelper() {
    return _exemploHelper;
  }

  ExemploHelper._internal() {
    inicializarDB();
  }

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "texto TEXT, "
        "numero INTEGER, "
        "data TEXT, "
        "slider REAL, "
        "switchValue INTEGER, "
        "checkboxValue INTEGER, "
        "radioValue INTEGER, "
        "selectValue TEXT, "
        "imagem TEXT"
        ")";
    await db.execute(sql);
  }

  inicializarDB() async {
    const String nomeBanco = "exemplo.db";
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, nomeBanco);
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarExemplo(Exemplo exemplo) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, exemplo.toMap());
    return resultado;
  }

  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY id DESC ";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarExemplo(Exemplo exemplo) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, exemplo.toMap(),
        where: "id = ?", whereArgs: [exemplo.id]);
  }

  Future<int> removerExemplo(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }

  Future<int> getNumber() async {
    var bancoDados = await db;
    const String sql = "SELECT COUNT(*) FROM $nomeTabela";
    List<Map<String, dynamic>> x = await bancoDados.rawQuery(sql);
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }

  Future fechar() async {
    var bancoDados = await db;
    bancoDados.close();
  }

  Future<Exemplo> getExemplo(int id) async {
    var bancoDados = await db;
    List<Map> maps = await bancoDados.query(nomeTabela,
        columns: [
          'id',
          'texto',
          'numero',
          'data',
          'slider',
          'switchValue',
          'checkboxValue',
          'radioValue',
          'selectValue',
          'imagem',
        ],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Exemplo.fromMap(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List> getExemplos() async {
    var bancoDados = await db;
    List<Map> maps = await bancoDados.query(nomeTabela,
        columns: [
          'id',
          'texto',
          'numero',
          'data',
          'slider',
          'switchValue',
          'checkboxValue',
          'radioValue',
          'selectValue',
          'imagem',
        ],
        orderBy: 'id DESC');
    if (maps.isNotEmpty) {
      return maps.map((e) => Exemplo.fromMap(e)).toList();
    } else {
      return [];
    }
  }
}
