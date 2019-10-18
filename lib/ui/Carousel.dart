import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:clone_olx/blocs/CarouselBloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselBloc carouselBloc;
  PageController carouselController;
  PageController carouselControllerFull;

  @override
  void initState() {
    carouselController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    carouselBloc = BlocProvider.getBloc<CarouselBloc>();
    carouselBloc.inputCurrentIndex.add(0);
    return Container(
      alignment: Alignment.topCenter,
      height: 280,
      child: PageView.builder(
        onPageChanged: (int index) {
          carouselBloc.inputCurrentImageToShowFull.add(index);
          carouselBloc.inputCurrentIndex.add(index);
        },
        controller: carouselController,
        itemCount: carouselBloc.images.length,
        itemBuilder: (BuildContext context, int index) {
          return imageSlider(index);
        },
      ),
    );
  }

  imageSlider(index) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: double.infinity,
          color: Colors.grey,
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              carouselBloc.inputCurrentImageToShowFull.add(index);
              showImageInDialog(index);
            },
            child:
                Image.asset(carouselBloc.images[index], fit: BoxFit.fitHeight),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    StreamBuilder(
                      stream: carouselBloc.outCurrentIndex,
                      builder: (context, snapshot) {
                        return snapshot.data == 0
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  carouselController
                                      .jumpToPage(snapshot.data - 1);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              );
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    StreamBuilder(
                      stream: carouselBloc.outCurrentIndex,
                      builder: (contex, snapshopt) {
                        return snapshopt.data == carouselBloc.images.length - 1
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  carouselController
                                      .jumpToPage(snapshopt.data + 1);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: StreamBuilder<int>(
                    initialData: 1,
                    stream: carouselBloc.outCurrentIndex,
                    builder: (context, AsyncSnapshot<int> snapshot) {
                      return Text(
                        "${(snapshot.data) + 1}/${carouselBloc.images.length}",
                        style: TextStyle(color: Colors.white),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showImageInDialog(index) {
    carouselControllerFull = PageController(initialPage: index);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              StreamBuilder<int>(
                  initialData: index,
                  stream: carouselBloc.outCurrentImageToShowFull,
                  builder: (context, snapshot) {
                    return Text(
                        "${(snapshot.data) + 1}/${carouselBloc.images.length}");
                  }),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: Icon(Icons.close),
              ),
            ],
          ),
          content: Container(
            alignment: Alignment.center,
            width: 500,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: PhotoViewGallery.builder(
                    backgroundDecoration: BoxDecoration(color: Colors.white),
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (context, index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: AssetImage(
                          carouselBloc.images[index],
                        ),
                        initialScale: PhotoViewComputedScale.contained * 1,
                      );
                    },
                    itemCount: carouselBloc.images.length,
                    pageController: carouselControllerFull,
                    onPageChanged: (index) {
                      carouselBloc.inputCurrentImageToShowFull.add(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
