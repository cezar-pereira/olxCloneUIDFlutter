import 'package:clone_olx/ui/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InsertAdPage extends StatelessWidget with Components {
  bool valueBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        centerTitle: false,
        title: Text("Inserir Anúncio"),
        actions: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "LIMPAR",
                textAlign: TextAlign.center,
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            color: Color(0xFFf2f2f2),
            child: CircleAvatar(
              backgroundColor: Color(0xFFcbcbcb),
              radius: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.camera_alt, color: Colors.white, size: 65),
                  Text("+ inserir",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ),
          buildTextField("Título *"),
          buildTextField("Descrição *"),
          TextFormField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                hintText: "CEP",
                hintStyle: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            color: Color(0xFFE8DCEF),
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text("Localização: DDD 82 - Alagoas", style: TextStyle(fontWeight: FontWeight.w600),),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.orange,
                      onChanged: (bool value) {
                        valueBox = value;
                      },
                      value: valueBox,
                    ),
                    Text("Ocultar o meu telefone neste anúncio"),
                  ],
                ),
                Text(
                    "Os interessados entrarão em contato com você por meio do nosso chat. :)"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            width: double.infinity,
            color: Color(0xFFE78423),
            child: Text(
              "Enviar",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  buildTextField(title) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: title,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 13, vertical: 13)));
  }
}