import 'package:abeero/core/constants.dart';
import 'package:abeero/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print('...............');
      await db.execute(''' 
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL ,
      $columnProductId TEXT NOT NULL)
       ''');
    });
  }

  insert(CartModel cartProductModel) async {
    var dbClient = await database;

    await dbClient?.insert(tableCartProduct, cartProductModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartModel cartProductModel) async {
    var dbClient = await database;
    return await dbClient?.update(tableCartProduct, cartProductModel.toJson(),
        where: '$columnProductId= ?', whereArgs: [cartProductModel.productId]);
  }

  getCartProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  deleteProductFromCart(String productId) async {
    var dbClient = await database;
    return await dbClient?.delete(
      tableCartProduct,
      where: '$columnProductId = ?',
      whereArgs: [productId],
    );
  }

  static void closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  // static Future<void> clearCartDatabase() async {
  //   var dbClient = await CartDatabaseHelper.db.database;
  //   if (dbClient != null) {
  //print('Before deletion: ${await dbClient.query(tableCartProduct)}');

  //     await dbClient.delete(tableCartProduct);
  //     await dbClient.close();
  //     _database = null;
  // print('After deletion: ${await dbClient.query(tableCartProduct)}');

  //   }
  // }

  Future<bool> isCartDatabaseEmpty() async {
    var dbClient = await CartDatabaseHelper.db.database;
    if (dbClient != null) {
      var count = Sqflite.firstIntValue(
          await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCartProduct'));
      return count == 0;
    }
    return true;
  }

  static Future<void> clearCartDatabase() async {
    var dbClient = await CartDatabaseHelper.db.database;
    if (dbClient != null) {
      print('Before deletion: ${await dbClient.query(tableCartProduct)}');
      await dbClient.delete(tableCartProduct);
      print('After deletion: ${await dbClient.query(tableCartProduct)}');

      await dbClient.close();
      _database = null;
    }
  }
}
