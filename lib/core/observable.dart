import 'package:flutter/foundation.dart';

class Observable<T> {
  T _value;
  final List<VoidCallback> _listeners = [];

  Observable(this._value);

  T get value => _value;

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _notifyListeners();
    }
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void listen(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void reset(T defaultValue) {
    _value = defaultValue;
    _notifyListeners();
  }
}