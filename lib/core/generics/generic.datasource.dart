import 'package:sembast/sembast.dart';
import 'package:simple_todo/core/generics/generic.entity.dart';
import 'package:simple_todo/core/locators/sembastDatabase.locator.dart';

class GenericSembastSource<T extends GenericEntity> {
  GenericSembastSource(this._entityStore);

  // Store com chave `int` e valores `Map<String, dynamic>`
  //Funciona como um map persistido, e recebe valores do GenericEntity T convertidos em Map
  final StoreRef<int, Map<String, dynamic>> _entityStore;

  // Getter da instancia singleton da BD aberta
  Future<Database> get _db async => SembastDatabaseLocator.instance.database;

  Future insert(T entity) async {
    await _entityStore.add(await _db, entity.toJsonMap());
  }

  Future update(T entity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _entityStore.update(
      await _db,
      entity.toJsonMap(),
      finder: finder,
    );
  }

  Future delete(T entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _entityStore.delete(
      await _db,
      finder: finder,
    );
  }

  //TODO: Adicionar parametro de filterBy
  //TODO: Adicionar parametro de filterAnd
  //TODO: Adicionar parametros de paginaçao -> start, end, limit, offset

  Future<List<RecordSnapshot<int, Map<String, dynamic>>>> fetchAllSnapshots(
      {List<String> sortBy}) async {
    final List<SortOrder> sortParams =
        sortBy?.map((e) => SortOrder(e))?.toList();
    final recordSnapshots = await _entityStore.find(
      await _db,
      finder: Finder(sortOrders: sortParams),
    );
    return recordSnapshots;
  }
}
