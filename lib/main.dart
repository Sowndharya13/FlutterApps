import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final title = 'Horizontal List';

      final List<String> imgList = [
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
      ];
      return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Builder(
            builder: (context) {
              final double height = MediaQuery
                  .of(context)
                  .size
                  .height;
//                return Builder(
//                  builder: (BuildContext context) {
//                    return Container(
//                      width: MediaQuery.of(context).size.width,
//                      margin: EdgeInsets.symmetric(horizontal: 5.0),
//                      decoration: BoxDecoration(color: Colors.amber),
//                      child: GestureDetector(
//                        child: Image.network(i, fit: BoxFit.fill),
//                        onTap: () {
//                          Navigator.push<Widget>(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => ImageScreen(i),
//                          ),
//                        );
//                      }));

              return CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                ),
                items: imgList.map((item) =>
                    Container(
                      child: GestureDetector(
                          child: Image.network(item, fit: BoxFit.fill),
                          onTap: () {
//                            Navigator.push<Widget>(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => ImageScreen(item),
//                            ),
//                            );
                            final snackBar = SnackBar(content: Text("Tap"));

                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                      )
                    )).toList(),
              );
            },
          ),

        ),
      );
    }
  }
