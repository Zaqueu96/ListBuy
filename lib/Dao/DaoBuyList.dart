import 'package:listbuy/config/AppDatabase.dart';
import 'package:listbuy/src/models/Buy.dart';
import 'package:listbuy/src/models/Item.dart';
import 'package:listbuy/src/models/Buy.dart';
import 'package:sembast/sembast.dart';

class DaoBuyList {
  static const String BUY_LIST = 'buysLists';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are User objects converted to Map
  final _daoList = intMapStoreFactory.store(BUY_LIST);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<int> insert(Buy buy) async {
    buy.created = DateTime.now().toString();
    int resultId = await _daoList.add(await _db, buy.toJson());
    return resultId;
  }

  Future<List<Buy>> getAll() async {
    final finder = Finder(sortOrders: [SortOrder('location')]);
    List<RecordSnapshot> resultSnapshot =
        await this._daoList.find(await _db, finder: finder);

    return resultSnapshot.map((snapshot) {
      Buy list = Buy.fromJson(snapshot.value);
      list.id = snapshot.key;
      return list;
    }).toList();
  }

  Future<Buy> getById(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    // Buy result = new Buy();
    List<RecordSnapshot> snapshot =
        await this._daoList.find(await _db, finder: finder);
      Buy result = Buy.fromJson(snapshot[0].value);
      print(result.list);
      print(snapshot[0].value);
      result.id = snapshot[0].key;
    return result;
  }

  Future update(Buy listbuy) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(listbuy.id));
    await _daoList.update(
      await _db,
      listbuy.toJson(),
      finder: finder,
    );
  }

  Future delete(Buy listbuy) async {
    final finder = Finder(filter: Filter.byKey(listbuy.id));
    await _daoList.delete(
      await _db,
      finder: finder,
    );
  }
}
