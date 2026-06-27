import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import '../domain/counter_entity.dart';
import 'counter_model.dart';

class CounterViewModel extends WidgetModel<CounterScreen, CounterModel> {
  final _counterState = EntityStateNotifier<int>();

  ListenableState<EntityState<int>> get counterState => _counterState;

  CounterViewModel(super._model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    try {
      final entity = await model.getCounter();
      _counterState.content(entity.value);
    } catch (_) {
      _counterState.error(Exception('Failed to load'));
    }
  }

  Future<void> increment() async {
    try {
      await model.incrementCounter();
      final entity = await model.getCounter();
      _counterState.content(entity.value);
    } catch (_) {
      _counterState.error(Exception('Failed to increment'));
    }
  }
}
