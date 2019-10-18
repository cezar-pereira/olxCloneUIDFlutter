import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class DrawerBloc extends BlocBase {
  StreamController<int> _currentItemSelected = BehaviorSubject<int>.seeded(0);

  Stream<int> get outCurrentItemSelected => _currentItemSelected.stream;
  Sink<int> get inCurrentItemSelected => _currentItemSelected;

  @override
  void dispose() {
    _currentItemSelected.close();
    super.dispose();
  }
}
