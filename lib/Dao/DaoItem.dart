import 'package:listbuy/config/AppDatabase.dart';
import 'package:listbuy/src/models/Item.dart';
import 'package:listbuy/src/models/Item.dart';
import 'package:sembast/sembast.dart';

class DaoItem {

  static const String ITEM = 'item';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are User objects converted to Map
  final _daoList = intMapStoreFactory.store(ITEM);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Item item) async {

    await _daoList.add(await _db, item.toJson());
  }

Future<Item> getById(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    List<RecordSnapshot> snapshot =
        await this._daoList.find(await _db, finder: finder);
      Item result = Item.fromJson(snapshot[0].value);
      print(snapshot[0].value);
      result.id = snapshot[0].key;
    return result;
  }
  Future<List<Item>> getAll()async{
    final finder = Finder(sortOrders: [SortOrder('name')]);
    List<RecordSnapshot>  resultSnapshot =  await this._daoList.find(
      await _db,finder: finder
      );

      return resultSnapshot.map((snapshot){
        Item list = Item.fromJson(snapshot.value);
        list.id  = snapshot.key;
        return list;
      }).toList();
  }

  Future update(Item item) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(item.id));
    await _daoList.update(
      await _db,
      item.toJson(),
      finder: finder,
    );
  }

  Future delete(Item item) async {
    final finder = Finder(filter: Filter.byKey(item.id));
    await _daoList.delete(
      await _db,
      finder: finder,
    );
  }
}
