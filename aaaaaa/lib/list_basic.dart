import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class Myapp3 extends StatelessWidget {
  const Myapp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBasic(

    );
  }
}

class ListBasic extends StatefulWidget {
  const ListBasic({Key? key}) : super(key: key);

  @override
  _ListBasicState createState() => _ListBasicState();
}

class _ListBasicState extends State<ListBasic> {
  @override
 Iterable<WordPair> data = generateWordPairs().take(100);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Danh sách cơ bản"),
        leading: Icon(Icons.line_style),
      ),
      // body:ListView(
      //   children: [
      //     Text(data[0]),
      //     Text(data[1]),
      //     Text(data[2])
      //   ],
      // ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder:(BuildContext context, int index){
            WordPair word= data.elementAt(index);
         return //Text(data[index],style:TextStyle(color: Colors.red,fontSize:20),);
          ListTile(
            title: Text(word.asPascalCase),
            leading: Icon(Icons.messenger),
            trailing:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){},icon: Icon(Icons.edit)),
                IconButton(onPressed: (){},icon: Icon(Icons.delete)),
              ],
            )
          );
      })

    );
  }
}

