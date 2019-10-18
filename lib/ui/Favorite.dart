import 'package:clone_olx/ui/Components.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.centerLeft, child: Text("Favoritos")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return cardAd(icon: Icons.delete_outline);
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 8,
          ),
        ),
      ),
    );
  }
}