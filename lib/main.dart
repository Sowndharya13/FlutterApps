import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import './preview_home_screen.dart';
//import './preview_lock_screen.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:path/path.dart' as path;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Alert Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: WallpaperImages(),
    );
  }

}
class WallpaperImages extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context,String img) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Set Image as"),

            actions: <Widget>[
              new FlatButton(
                child: new Text('HomeScreen'),
                onPressed: () {
                  _setAsHomeScreen(context,img);
                },
              ),
              new FlatButton(
                child: new Text('LockScreen'),
                onPressed: () {
                  _setAsLockScreen(context,img);
                },
              )
            ],
          );
        });
  }

  _setAsHomeScreen(BuildContext context,String img_url) async  {

    String url = img_url;
    int location = WallpaperManager.HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    result = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  _setAsLockScreen(BuildContext context,String img_url) async  {

    String url = img_url;
    int location = WallpaperManager.LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    result = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  @override
  Widget build(BuildContext context) {
    final title = 'YourWall';

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
            return CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
              ),
              items: imgList.map((item) =>
                  Container(
                      child:
                            GestureDetector(
                                child:
                                Image.network(item, fit: BoxFit.fill),

                                onDoubleTap: () {
//                            Navigator.push<Widget>(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => ImageScreen(item),
//                            ),
//                            );
//                                  final snackBar = SnackBar(content: Text(item));
//                              _buildButtonColumn(Colors.red, Icons.call, 'Set as wallpaper');
                                  _displayDialog(context,item);
//                                  Scaffold.of(context).showSnackBar(snackBar);
                                }
                            ),
                  )).toList(),
            );
          },
        ),

      ),
    );

  }
}

