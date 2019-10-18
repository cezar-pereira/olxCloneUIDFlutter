import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:clone_olx/blocs/HomeBloc.dart';
import 'package:clone_olx/ui/Components.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with Components {
  HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.getBloc<HomeBloc>();
    homeBloc.inSearchIsVisible.add(false);
    return Stack(
      children: <Widget>[
        Scaffold(
          resizeToAvoidBottomPadding: false,
          drawer: drawer(context),
          appBar: AppBar(
            actions: <Widget>[
              Tooltip(
                message: "Buscar",
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    homeBloc.inSearchIsVisible.add(true);

                    homeBloc.inHistoricIsVisible.add(false);
                  },
                ),
              ),
              Tooltip(
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                message: "Salvar busca",
              ),
            ],
          ),
          body: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(height: 50),
                          selectionAccordingToResearchHistory(),
                          SizedBox(height: 10),
                          selectionAccordingToLocation(),
                          SizedBox(height: 10),
                          listAd(),
                        ],
                      ),
                    ),
                  ],
                ),
                filters(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: bottomAnnounce(context),
        ),
        dialogSearch(context),
      ],
    );
  }

  filters() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: 0.2,
          blurRadius: 1,
          color: Colors.black,
        )
      ]),
      height: 45,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "DDD 82 - Alagoas",
            style: TextStyle(color: Color(0xFF5E31D2)),
            textAlign: TextAlign.center,
          )),
          Container(width: 1, color: Colors.black.withOpacity(0.2)),
          Expanded(
              child: Text(
            "Categoria",
            style: TextStyle(color: Color(0xFF5E31D2)),
            textAlign: TextAlign.center,
          )),
          Container(width: 1, color: Colors.black.withOpacity(0.2)),
          Expanded(
              child: Text(
            "Filtros",
            style: TextStyle(color: Color(0xFF5E31D2)),
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }

  selectionAccordingToResearchHistory() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      height: 300,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Selecionamos para você!", style: TextStyle(fontSize: 20)),
          Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return cardSelection(context);
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 16)))
        ],
      ),
    );
  }

  selectionAccordingToLocation() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      height: 300,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Anúncios próximos a você!", style: TextStyle(fontSize: 20)),
          Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return cardSelection(context);
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 16)))
        ],
      ),
    );
  }

  listAd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text("Mais anúncios", style: TextStyle(fontSize: 20)),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return cardAd(icon: null, context: context);
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 8),
        )
      ],
    );
  }

  dialogSearch(context) {
    return StreamBuilder(
      initialData: false,
      stream: homeBloc.outSearchIsVisible,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return Visibility(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(7, 4, 7, 0),
                child: Material(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            boxShadow: [BoxShadow(color: Colors.white)]),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                homeBloc.inSearchIsVisible.add(false);
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Material(
                                  color: Colors.white,
                                  child: TextField(
                                    onTap: () {
                                      homeBloc.inHistoricIsVisible.add(true);
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    autofocus: true,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Pesquisar",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder(
                        initialData: false,
                        stream: homeBloc.outHistoricIsVisible,
                        builder: (context, AsyncSnapshot<bool> snapshot) {
                          return Visibility(
                            child: Container(
                              color: Colors.white,
                              height: 1500,
                              child: ListView.builder(
                                itemCount: 60,
                                shrinkWrap: false,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          "histórico de pesquisa",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            visible: snapshot.data,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          visible: snapshot.data,
        );
      },
    );
  }
}
