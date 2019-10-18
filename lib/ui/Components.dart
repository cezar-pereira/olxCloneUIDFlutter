import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:clone_olx/blocs/DrawerBloc.dart';
import 'package:clone_olx/ui/AdPage.dart';
import 'package:clone_olx/ui/ChatPage.dart';
import 'package:clone_olx/ui/Favorite.dart';
import 'package:clone_olx/ui/HomePage.dart';
import 'package:clone_olx/ui/InsertAdPage.dart';
import 'package:flutter/material.dart';

const double sizeFont = 16;
DrawerBloc drawerBloc = BlocProvider.getBloc<DrawerBloc>();

class Components {
  drawer(context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 90,
              color: Theme.of(context).primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nome",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "nome@dominio.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildItemDrawLogo(context, 0),
            buildItemDraw(
                context, 1, "Inserir anúncio", Icons.edit, InsertAdPage()),
            buildItemDraw(
                context, 2, "Chat", Icons.chat_bubble_outline, ChatPage()),
            buildItemDraw(
                context, 3, "Favoritos", Icons.favorite_border, FavoritePage()),
            Divider(),
            buildLinkDraw("Ajuda e Contato"),
            buildLinkDraw("Dúvidas Frequentes"),
            buildLinkDraw("Dicas de Segurança"),
            buildLinkDraw("Termos de Uso"),
            buildLinkDraw("Avalie na Google Play"),
            buildLinkDraw("Curta no Facebook"),
          ],
        ),
      ),
    );
  }

  buildItemDrawLogo(context, index) {
    return FlatButton(
      splashColor: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8),
        leading: StreamBuilder(
            stream: drawerBloc.outCurrentItemSelected,
            builder: (context, snapshot) {
              return Container(
                height: 25,
                width: 25,
                child: snapshot.data == index
                    ? Image.asset("assets/olx-logo-enable.png")
                    : Image.asset("assets/olx-logo-disable.png"),
              );
            }),
        title: StreamBuilder<Object>(
            stream: drawerBloc.outCurrentItemSelected,
            builder: (context, snapshot) {
              return Text("Anúncios",
                  style: TextStyle(
                      color: snapshot.data == index
                          ? Colors.orange
                          : Colors.black));
            }),
      ),
      onPressed: () {
        drawerBloc.inCurrentItemSelected.add(0);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      },
    );
  }

  buildItemDraw(context, index, title, icon, page) {
    return FlatButton(
      splashColor: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8),
        leading: Container(
          height: 25,
          width: 25,
          child: StreamBuilder<int>(
              stream: drawerBloc.outCurrentItemSelected,
              builder: (context, snapshot) {
                return Icon(
                  icon,
                  color: snapshot.data == index
                      ? Colors.orange
                      : Colors.black.withOpacity(0.6),
                );
              }),
        ),
        title: StreamBuilder<int>(
            stream: drawerBloc.outCurrentItemSelected,
            builder: (context, snapshot) {
              return Text(title,
                  style: TextStyle(
                      color: snapshot.data == index
                          ? Colors.orange
                          : Colors.black));
            }),
      ),
      onPressed: () {
        drawerBloc.inCurrentItemSelected.add(index);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
    );
  }

  buildLinkDraw(title) {
    return FlatButton(
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        alignment: Alignment.centerLeft,
        height: 45,
        child: Text(title),
      ),
      onPressed: () {},
    );
  }

  cardSelection(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdPage();
        }));
      },
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset("assets/model_Image.jpg", fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 4),
            Text("Título", style: TextStyle(fontSize: sizeFont)),
            Text("R\$ 1.000", style: TextStyle(fontSize: sizeFont)),
          ],
        ),
      ),
    );
  }

  cardAd({icon, context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdPage();
        }));
      },
      child: Container(
        height: 130,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 0.3,
                  color: Colors.black38,
                  offset: Offset(0, 0.5))
            ]),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                child: Image.asset("assets/model_Image.jpg", fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Título",
                        style: TextStyle(fontSize: sizeFont),
                      ),
                    ),
                    Container(
                      child: Text("R\$ 1.000",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: sizeFont)),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("01 janeiro 00:00, Maceió",
                              style: TextStyle(fontSize: sizeFont)),
                          GestureDetector(
                              child: icon == null
                                  ? Container()
                                  : Icon(
                                      icon,
                                      size: sizeFont,
                                    ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomAnnounce(context) {
    return GestureDetector(
      onTap: () {
        drawerBloc.inCurrentItemSelected.add(1);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InsertAdPage();
        }));
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadiusDirectional.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Anunciar agora",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
