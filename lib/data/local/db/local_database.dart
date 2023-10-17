import 'package:coffeelito/data/models/product/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("coffee.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${CoffeeModelFields.tableName} (
    ${CoffeeModelFields.id} $idType,
    ${CoffeeModelFields.coffeeId} $intType,
    ${CoffeeModelFields.coffeePrice} $intType,
    ${CoffeeModelFields.count} $intType,
    ${CoffeeModelFields.coffeeName} $textType,
    ${CoffeeModelFields.coffeeImage} $textType,
    ${CoffeeModelFields.categoryId} $textType,
    ${CoffeeModelFields.description} $textType
    );
    ''');
  }

  //-------------------Cart Products------------------------

  static Future<CoffeeModelSql> insertProduct(
      CoffeeModelSql productModelForSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        CoffeeModelFields.tableName, productModelForSql.toJson());
    return productModelForSql.copyWith(id: id);
  }

  static Future<List<CoffeeModelSql>> getAllProducts() async {
    List<CoffeeModelSql> allProducts = [];
    final db = await getInstance.database;
    allProducts = (await db.query(CoffeeModelFields.tableName))
        .map((e) => CoffeeModelSql.fromJson(e))
        .toList();
    return allProducts;
  }

  static Future<bool> checkProduct({required int id}) async {
    final db = await getInstance.database;
    List<Map<String, dynamic>> result = await db.query(
      CoffeeModelFields.tableName,
      where: '${CoffeeModelFields.coffeeId} = ? ',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }

  static incrementProduct({required int id}) async {
    final db = await getInstance.database;
    await db.execute(
        "UPDATE ${CoffeeModelFields.tableName} SET ${CoffeeModelFields.count} = ${CoffeeModelFields.count} + 1 WHERE ${CoffeeModelFields.coffeeId} = $id;");
  }

  static decrementProduct({required int id}) async {
    final db = await getInstance.database;
    await db.execute(
        "UPDATE ${CoffeeModelFields.tableName} SET ${CoffeeModelFields.count} = ${CoffeeModelFields.count} - 1 WHERE ${CoffeeModelFields.coffeeId} = $id;");
  }

  static deleteProduct(int id) async {
    final db = await getInstance.database;
    db.delete(
      CoffeeModelFields.tableName,
      where: "${CoffeeModelFields.coffeeId} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllProducts() async {
    final db = await getInstance.database;
    db.delete(
      CoffeeModelFields.tableName,
    );
  }

  //------------------------Favorites Product--------------------------

  static Future<CoffeeModelSql> insertProductToFavorites(
      CoffeeModelSql productModelForSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        CoffeeModelFields.favorites, productModelForSql.toJson());
    return productModelForSql.copyWith(id: id);
  }

  static Future<List<CoffeeModelSql>> getAllFavorites() async {
    List<CoffeeModelSql> allProducts = [];
    final db = await getInstance.database;
    allProducts = (await db.query(CoffeeModelFields.favorites))
        .map((e) => CoffeeModelSql.fromJson(e))
        .toList();
    return allProducts;
  }

  static Future<List<String>> getAllFavoritesId() async {
    List<String> allID = [];
    final db = await getInstance.database;
    allID = (await db.query(CoffeeModelFields.favorites))
        .map((e) => CoffeeModelSql.fromJson(e).coffeeId.toString())
        .toList();
    return allID;
  }

  static deleteProductFromFavorites(int id) async {
    final db = await getInstance.database;
    db.delete(
      CoffeeModelFields.favorites,
      where: "${CoffeeModelFields.coffeeId} = ?",
      whereArgs: [id],
    );
  }
}
