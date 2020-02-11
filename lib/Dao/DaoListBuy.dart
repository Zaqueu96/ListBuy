import 'package:listbuy/config/AppDatabase.dart';
import 'package:listbuy/src/src/models/Item.dart';
import 'package:listbuy/src/src/models/ListBuy.dart';
import 'package:sembast/sembast.dart';

class DaoListBuy {

  static const String LIST_BUY = 'listsBuys';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are User objects converted to Map
  final _daoList = intMapStoreFactory.store(LIST_BUY);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(ListBuy listbuy) async {
    await _daoList.add(await _db, listbuy.toJson());
  }

  Future<List<ListBuy>> getAll()async{
    final finder = Finder(sortOrders: [SortOrder('name')]);
    List<RecordSnapshot>  resultSnapshot =  await this._daoList.find(
      await _db,finder: finder
      );

      return resultSnapshot.map((snapshot){ 
        ListBuy list = ListBuy.fromJson(snapshot.value);
        list.id  = snapshot.key;
        return list;
      }).toList();
  }

  Future update(ListBuy listbuy) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(listbuy.id));
    await _daoList.update(
      await _db,
      listbuy.toJson(),
      finder: finder,
    );
  }

  Future delete(ListBuy listbuy) async {
    final finder = Finder(filter: Filter.byKey(listbuy.id));
    await _daoList.delete(
      await _db,
      finder: finder,
    );
  }
}