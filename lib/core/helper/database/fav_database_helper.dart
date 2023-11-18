import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/favourite_model.dart';
import '../../constants.dart';

class FavDatabaseHelper {
  FavDatabaseHelper._();

  static final FavDatabaseHelper db = FavDatabaseHelper._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'FavProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print('...............');
      await db.execute(''' 
      CREATE TABLE $tableProductFav (
      $columnNameFav TEXT NOT NULL,
      $columnImageFav TEXT NOT NULL,
      $columnPriceFav TEXT NOT NULL,
      $columnProductIdFav TEXT NOT NULL)
       ''');
    });
  }

  insert(FavouriteModel favouriteModel) async {
    var dbClient = await database;

    await dbClient?.insert(tableProductFav, favouriteModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(FavouriteModel favouriteModel) async {
    var dbClient = await database;
    return await dbClient?.update(tableProductFav, favouriteModel.toJson(),
        where: '$columnProductId= ?', whereArgs: [favouriteModel.productId]);
  }

  Future<bool> isFavDatabaseEmpty() async {
    var dbClient = await FavDatabaseHelper.db.database;
    if (dbClient != null) {
      var count = Sqflite.firstIntValue(
          await dbClient.rawQuery('SELECT COUNT(*) FROM $tableProductFav'));
      return count == 0;
    }
    return true;
  }

  getFavProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableProductFav);
    List<FavouriteModel> list = maps.isNotEmpty
        ? maps.map((product) => FavouriteModel.fromJson(product)).toList()
        : [];
    return list;
  }

  deleteProductFromFavorites(String productId) async {
    var dbClient = await database;
    return await dbClient?.delete(
      tableProductFav,
      where: '$columnProductIdFav = ?',
      whereArgs: [productId],
    );
  }

  Future<bool> isProductInFavorites(String productId) async {
    var dbClient = await database;
    List<Map> maps = (await dbClient?.query(
      tableProductFav,
      where: '$columnProductIdFav = ?',
      whereArgs: [productId],
    ))!
        .cast<Map>();
    return maps.isNotEmpty;
  }

  static Future<void> clearFavDatabase() async {
    var dbClient = await FavDatabaseHelper.db.database;
    if (dbClient != null) {
      print('Before deletion: ${await dbClient.query(tableProductFav)}');

      await dbClient.delete(tableProductFav);
      print('After deletion: ${await dbClient.query(tableProductFav)}');

      await dbClient.close();
      _database = null;
    }
  }
}
