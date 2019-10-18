import 'package:clone_olx/ui/Carousel.dart';
import 'package:flutter/material.dart';

class AdPage extends StatelessWidget {
  standardSpacing() {
    return const SizedBox(height: 12);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Anúncio"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Carousel(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            standardSpacing(),
                            Text(
                              "R\$ 1000.00",
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.w300),
                            ),
                            standardSpacing(),
                            Text(
                              "Título",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            standardSpacing(),
                            Text(
                              "Publicado em 01/01/2019 às 00:00",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            standardSpacing(),
                            customDivider(),
                            standardSpacing(),
                            Text("Descrição",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                            standardSpacing(),
                            Text("Descrição", style: const TextStyle(fontSize: 18)),
                            standardSpacing(),
                            customDivider(),
                            standardSpacing(),
                            details(),
                            standardSpacing(),
                            customDivider(),
                            standardSpacing(),
                            location(),
                            standardSpacing(),
                            customDivider(),
                            standardSpacing(),
                            dataUser(),
                           const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomChat(),
                ],
              ),
            ),
          ),
        ),
        imageSliderFull(),
      ],
    );
  }

  customDivider() {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.black.withOpacity(0.5),
    );
  }

  bottomChat() {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.bottomCenter,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            decoration: BoxDecoration(
                color: Color(0xffEC8834),
                borderRadius: BorderRadius.circular(40)),
            child: Text(
              "Chat",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                border:
                    Border(top: BorderSide(width: 0.5, color: Colors.black54))),
            padding: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "Nome (anunciante)",
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }

  carouselImagesAd() {
    return Container(
      height: 200,
      child: Carousel(),
    );
  }

  details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Detalhes",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        SizedBox(height: 16),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Detalhe",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7)))),
                  Expanded(
                      child: Text(
                    "Descrição",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7)),
                  )),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  location() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Localização",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        SizedBox(height: 16),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Detalhe",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7)))),
                  Expanded(
                      child: Text("Descrição",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7)))),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  dataUser() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF1F1F1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Text(
                "Nome",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )),
              Icon(Icons.android),
              SizedBox(width: 4),
              Icon(Icons.android),
              SizedBox(width: 4),
              Icon(Icons.android),
            ],
          ),
          standardSpacing(),
          Text("Na olx desde janeiro de 2000",
              style: TextStyle(color: Colors.black.withOpacity(0.7))),
          Text("Último acesso há 1 hora",
              style: TextStyle(color: Colors.black.withOpacity(0.7))),
          Divider(),
          Text("ver perfil completo",
              style: TextStyle(color: Color(0xff331D99))),
        ],
      ),
    );
  }

  imageSliderFull() {
    return Visibility(
      visible: false,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 350,
          width: 350,
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("1/5", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Container(),
                    ),
                    GestureDetector(
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text("Image"),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 10,
                    width: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(40)),
                          height: 10,
                          width: 10,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 5);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
