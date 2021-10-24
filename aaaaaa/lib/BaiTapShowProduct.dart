import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyApp7 extends StatelessWidget {
  const MyApp7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FetchaData(),
    );
  }
}

class FetchaData extends StatefulWidget {
  const FetchaData({Key? key}) : super(key: key);

  @override
  _FetchaDataState createState() => _FetchaDataState();
}

class _FetchaDataState extends State<FetchaData> {
  late Future<List<fetcha>> lsfetch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsfetch = fetcha.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: lsfetch,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData){
            var data = snapshot.data as List<fetcha>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  fetcha f = data[index];
                  return Text(f.title);
                });
          }
          else{
            return CircularProgressIndicator(value: 5);
          }
        },
      ),
    );
  }
}

class fetcha{
  final int id;
  final String title;
  final double prince;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  fetcha({required this.id, required this.title, required this.prince, required this.description, required this.category, required this.image, required this.rating});

  static Future<List<fetcha>> fetchData() async{
    String url = "https://fakestoreapi.com/products?limit=100";
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    print(reponse);
    if(reponse.statusCode == 200){
      var result = reponse.body;
      var jsonData = jsonDecode(result);//.cast<List<Map<String, dynamic>>>();
      List<fetcha> ls = [];
      for(var item in jsonData){
        print(item.runtimeType);
        fetcha fc = new fetcha(id: item['id'], title: item['title'],
            prince: item['prince'], description: item['description'], category: item['category'],
            image: item['image'], rating: item['rating']);
        ls.add(fc);
      }
      return ls;
    }
    else{
      throw Exception("Lỗi lấy dữ liệu. Chi tiết: ${reponse.statusCode}");
    }
  }

}

class Rating{
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  static Future<List<Rating>> fetchData() async{
    String url = "https://fakestoreapi.com/products?limit=5";
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    if(reponse.statusCode == 200){
      var result = reponse.body;
      var jsonData = jsonDecode(result);//.cast<List<Map<String, dynamic>>>();
      List<Rating> ls = [];
      for(var item in jsonData){
        print(item.runtimeType);
        Rating r = new Rating(rate: item['rate'], count: item['count']);
        ls.add(r);
      }
      return ls;
    }
    else{
      throw Exception("Lỗi lấy dữ liệu. Chi tiết: ${reponse.statusCode}");
    }
  }
}