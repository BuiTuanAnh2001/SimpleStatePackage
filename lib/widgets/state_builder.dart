import 'package:flutter/widgets.dart';
import '../core/state_manager.dart';
import '../core/observable.dart';

class StateBuilder<T> extends StatefulWidget {
  final String keyName;
  final Widget Function(BuildContext context, T value) builder;

  const StateBuilder({
    super.key,
    required this.keyName,
    required this.builder,
  });

  @override
  State<StateBuilder<T>> createState() => _StateBuilderState<T>();
}

class _StateBuilderState<T> extends State<StateBuilder<T>> {
  late Observable<T> _observable;

  @override
  void initState() {
    super.initState();
    _observable = StateManager().get<T>(widget.keyName);
    _observable.listen(_onStateChanged);
  }

  void _onStateChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _observable.removeListener(_onStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _observable.value);
  }
}