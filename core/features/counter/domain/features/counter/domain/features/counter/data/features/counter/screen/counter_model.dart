import 'package:elementary/elementary.dart';
import '../data/counter_repository_impl.dart';
import '../domain/counter_entity.dart';
import '../domain/counter_repository.dart';

class CounterModel extends ElementaryModel {
  final CounterRepository _repository;

  CounterModel(this._repository);

  factory CounterModel.create() {
    return CounterModel(CounterRepositoryImpl());
  }

  Future<CounterEntity> getCounter() {
    return _repository.getCounter();
  }

  Future<void> incrementCounter() {
    return _repository.incrementCounter();
  }
}
