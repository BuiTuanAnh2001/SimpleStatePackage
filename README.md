# simple_state

A simple and lightweight state management package for Flutter, built without using any existing state management packages like Provider, Riverpod, etc.

## Features

- Manage simple and complex state (primitive, list, map, etc.).
- Efficient UI updates: Only rebuilds when relevant state changes.
- Supports both synchronous and asynchronous state updates.
- Easy integration into existing Flutter apps.

## Getting Started

### 1. Add to your pubspec.yaml:

```yaml
dependencies:
  simple_state:
    git:
      url: https://github.com/BuiTuanAnh2001/SimpleStatePackage
```

_(or once published: just use `simple_state: ^0.0.1`)_

### 2. Example Usage:

```dart
final counter = StateManager().create<int>('counter', 0);

StateBuilder<int>(
  keyName: 'counter',
  builder: (context, value) => Text('Count: $value'),
);
```

## License

MIT
