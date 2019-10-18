import 'package:clone_olx/ui/Components.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text("Chats"),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return buildItensChat(disable: true);
        },
      ),
    );
  }

  buildItensChat({disable = false}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset("assets/model_Image.jpg", fit: BoxFit.cover),
                  disable == true
                      ? Container(
                          color: Colors.grey.withOpacity(0.6),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Título",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Usuário",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("Mensagem..."),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          children: <Widget>[
                            Text("Dom, 1 de Jan"),
                            disable == true
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey),
                                    child: Text("anúncio inativo", style: TextStyle(color: Colors.white),),
                                  )
                                : Container()
                          ],
                        )),
                  ],
                ),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
