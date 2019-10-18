import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  BehaviorSubject<bool> _searchIsVisibleController =
      BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> _historicIsVisibleController =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get outSearchIsVisible => _searchIsVisibleController.stream;
  Sink<bool> get inSearchIsVisible => _searchIsVisibleController.sink;
  Stream<bool> get outHistoricIsVisible => _historicIsVisibleController.stream;
  Sink<bool> get inHistoricIsVisible => _historicIsVisibleController.sink;

  @override
  void dispose() {
    super.dispose();
    _searchIsVisibleController.close();
    _historicIsVisibleController.close();
  }
}
