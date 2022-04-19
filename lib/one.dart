
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/two.dart';

class one extends StatefulWidget {
  const one({Key? key}) : super(key: key);

  @override
  _oneState createState() => _oneState();
}

class _oneState extends State<one> {


  List<String> names =['best wishes shayri','friendship shayri','funny shayri',
    'god shayri','inspiration shayri','life shayri',
    'mohabbat shayri','memories shayri','other shayri',
    'politics shayri'];

  List<String> imagelist = ["images/1.jpg","images/2.jpg","images/3.jpg",
    "images/4.jpg","images/5.jpg","images/6.jpg",
    "images/7.jpg","images/8.jpg","images/9.jpg",
    "images/10.jpg"];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("love shayri"),
      ),
      backgroundColor: Colors.grey,
      body:  ListView.builder(
        itemCount: imagelist.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return two(index,names);
                },));
              },
              tileColor: Colors.white,

              title: Text(names[index],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,),),
              leading: Image.asset(imagelist[index],height: 50,width: 50,fit: BoxFit.fill,),
            ),
          );
        },
      ),
    );
  }
}

