import 'observable.dart';

class StateManager {
  static final StateManager _instance = StateManager._internal();
  factory StateManager() => _instance;
  StateManager._internal();

  final Map<String, Observable> _states = {};

  Observable<T> create<T>(String key, T initialValue) {
    if (_states.containsKey(key)) {
      throw Exception("State with key '$key' already exists.");
    }
    final observable = Observable<T>(initialValue);
    _states[key] = observable;
    return observable;
  }

  Observable<T> get<T>(String key) {
    final observable = _states[key];
    if (observable == null || observable is! Observable<T>) {
      throw Exception("No state found for key '$key'");
    }
    return observable;
  }

  void reset(String key, dynamic defaultValue) {
    if (_states[key] != null) {
      _states[key]!.reset(defaultValue);
    }
  }

  void delete(String key) {
    _states.remove(key);
  }

  void clear() {
    _states.clear();
  }
}