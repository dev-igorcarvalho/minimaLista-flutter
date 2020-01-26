import 'package:sembast/sembast.dart';
import 'package:simple_todo/core/generics/generic.datasource.dart';
import 'package:simple_todo/core/generics/generic.snapshotFecher.dart';
import 'package:simple_todo/features/tasks/data/models/taskEntityImpl.dart';

class TaskDatasourceImpl extends GenericSembastSource<TaskEntityImpl>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'Tasks Store';
  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  TaskDatasourceImpl() : super(entityStore);

  @override
  Future<List<TaskEntityImpl>> fetchAll(
      {List<String> sortParams, List<String> filterParams}) async {
    final snapshots = await super.fetchAllSnapshots(sortBy: sortParams);

    final result = snapshots.map((snapshot) {
      final entity = TaskEntityImpl.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.id = snapshot.key;
      return entity;
    }).toList();
    return result;
  }
}
