import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:clone_olx/blocs/CarouselBloc.dart';
import 'package:clone_olx/blocs/DrawerBloc.dart';
import 'package:clone_olx/blocs/HomeBloc.dart';
import 'package:clone_olx/ui/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => HomeBloc()),
        Bloc((i) => DrawerBloc()),
        Bloc((i) => CarouselBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: const Color(0xFF5E31D2)),
        home: HomePage(),
      ),
    );
  }
}
