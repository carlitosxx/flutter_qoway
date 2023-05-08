// import 'package:database/src/models/usuario.model.dart';
// ignore: depend_on_referenced_packages
import 'package:database/src/models/cuenta.model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// import 'package:database/src/models/divisa.model.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// {@template database}
/// database sqlite
/// {@endtemplate}
class Db {
  static Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE actividad(
          id INTEGER
        );       
      ''');
    await db.execute(
        '''
        INSERT INTO actividad(id)
        values(0);
      ''');

    await db.execute(
        '''
        CREATE TABLE usuario(
          id INTEGER PRIMARY KEY ,
          nombre TEXT,
          correo TEXT UNIQUE,
          clave TEXT,
          descDivisa TEXT,
          cortoDivisa TEXT,
          simboloDivisa TEXT,
          ladoDivisa INTEGER);       
      ''');
    await db.execute(
        '''
        CREATE TABLE cuenta(
          id INTEGER PRIMARY KEY,
          descripcion TEXT,
          estaIncluido INTEGER,
          idUsuario INTEGER,
          FOREIGN KEY(idUsuario) REFERENCES usuario(id));          
      ''');
    await db.execute(
        '''
        CREATE TABLE movimiento(
          id INTEGER PRIMARY KEY,
          tipoMovimiento INTEGER,
          monto REAL,
          fecha INTEGER,
          comentario TEXT,
          idCuenta INTEGER,
          FOREIGN KEY(idCuenta) REFERENCES cuenta(id)
          );
      ''');
    await db.execute(
        '''
        CREATE TABLE divisa(
          id INTEGER PRIMARY KEY,
          descDivisa TEXT,
          cortoDivisa TEXT,
          simboloDivisa TEXT,
          ladoDivisa INTEGER);
      ''');
    await db.execute(
        r'''
        INSERT INTO divisa(descDivisa,cortoDivisa,simboloDivisa,ladoDivisa)
        values
        ('Boliviano','BOB','Bs.',1),
        ('Guarani','PYG','₲',0),
        ('Peso argentino','ARS','$',1),
        ('Peso chileno','CLP','$',1),
        ('Sol','PEN','S/.',0);
      ''');
  }

  static Future<Database> _openDB() async {
    // final documentsDirectory = await getApplicationDocumentsDirectory();
    // final path = join(documentsDirectory.path, 'qoway.db');

    return openDatabase(
      join(await getDatabasesPath(), 'qoway.db'),
      onCreate: _onCreate,
      version: 1,
      onConfigure: _onConfigure,
    );
  }

  /// Eliminar bnase de datos
  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  /// Insertar usuario
  Future<int> insertUser(
    String name,
    String email,
    String clave,
    String descDivisa,
    String cortoDivisa,
    String simboloDivisa,
    int ladoDivisa,
  ) async {
    try {
      final database = await _openDB();
      final usuario = {
        'nombre': name,
        'correo': email,
        'clave': clave,
        'descDivisa': descDivisa,
        'cortoDivisa': cortoDivisa,
        'simboloDivisa': simboloDivisa,
        'ladoDivisa': ladoDivisa,
      };
      final idUsuario = await database.insert('usuario', usuario);
      final cuenta = Cuenta(
        descripcion: 'Main',
        estaIncluido: 1,
        idUsuario: idUsuario,
      );
      await database.insert('cuenta', cuenta.toMap());
      return idUsuario;
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return -1;
      }
      return 0;
    }
  }

  /// Obtener usuario por correo y clave
  Future<List<Map<String, dynamic>>> obtenerUsuario(
    String email,
    String clave,
  ) async {
    final database = await _openDB();
    return database.query(
      'usuario',
      where: 'correo=? and clave=?',
      whereArgs: [email, clave],
      limit: 1,
    );
  }

  ///OBTENER LISTA DE DIVISAS
  Future<List<Map<String, dynamic>>> getCurrencies() async {
    final database = await _openDB();
    final List<Map<String, dynamic>> divisasMap =
        await database.query('divisa');
    return divisasMap;
  }
}
