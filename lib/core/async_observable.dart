import 'observable.dart';

class AsyncObservable<T> extends Observable<T> {
  AsyncObservable(super.value);

  Future<void> update(Future<T> future) async {
    T result = await future;
    value = result;
  }
}