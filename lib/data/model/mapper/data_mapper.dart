import '../../../domain/define.dart';
import '../define.dart';

abstract class DataMapper<D extends DataModel, E extends Entity> {
  E mapToEntity(D data);

  List<E> mapToListEntity(List<D>? list) {
    return list?.map(mapToEntity).toList() ?? List.empty();
  }
}
