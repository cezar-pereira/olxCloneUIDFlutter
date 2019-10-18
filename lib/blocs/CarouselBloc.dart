import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class CarouselBloc extends BlocBase {
  List<String> images = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
  ];

  StreamController<int> _currentIndex = BehaviorSubject<int>.seeded(0);
  StreamController<int> _currentImageToShowFull =
      BehaviorSubject<int>.seeded(0);

  Stream<int> get outCurrentIndex => _currentIndex.stream;
  Sink<int> get inputCurrentIndex => _currentIndex.sink;
  Stream<int> get outCurrentImageToShowFull => _currentImageToShowFull.stream;
  Sink<int> get inputCurrentImageToShowFull => _currentImageToShowFull.sink;

  @override
  void dispose() {
    _currentIndex.close();
    _currentImageToShowFull.close();
    super.dispose();
  }
}
