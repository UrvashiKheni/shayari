
import 'package:flutter/material.dart';
import 'package:shayari/three.dart';

import 'model.dart';

class two extends StatefulWidget {

  int index;
  List<String> names;

  two(this.index, this.names,);

  @override
  _twoState createState() => _twoState();
}

class _twoState extends State<two> {

  List<String> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    if(widget.index==0)
    {
      list = model().s1;
    }
    else if (widget.index==1)
    {
      list = model().s2;
    }
    else if (widget.index==2)
    {
      list = model().s3;
    }
    else if (widget.index==3)
    {
      list = model().s4;
    }
    else if (widget.index==4)
    {
      list = model().s5;
    }
    else if (widget.index==5)
    {
      list = model().s6;
    }
    else if (widget.index==6)
    {
      list = model().s7;
    }
    else if (widget.index==7)
    {
      list = model().s8;
    }
    else if (widget.index==8)
    {
      list = model().s9;
    }
    else if (widget.index==9)
    {
      list = model().s10;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.names[widget.index]),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 7,right: 7,bottom: 5,top: 5),
            child: ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return three(list,index);
                },));
              },
              tileColor: Colors.pink,
              title: Text(
                list[index],
                maxLines: 1,
              ),
            ),
          );
        },
      ),

    );
  }
}