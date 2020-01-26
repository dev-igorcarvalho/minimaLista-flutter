import 'package:MinimaList/core/generics/generic.entity.dart';

abstract class SnapshotFetcher {
  Future<List<GenericEntity>> fetchAll(
      {List<String> sortParams, List<String> filterParams});
}
