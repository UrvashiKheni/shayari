
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:shayari/four.dart';

class three extends StatefulWidget {

  List<String> list;
  int index;

  three(this.list, this.index);

  @override
  _threeState createState() => _threeState();
}

class _threeState extends State<three> {

  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: Column(
          children: [
            Container(
              height: 40,
              width: 80,
              margin: EdgeInsets.all(10),
              child: Text("${widget.index}/${widget.list.length-1}",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
            Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.list.length,
                  onPageChanged: (value) {
                    print(value);
                    setState(() {
                      widget.index = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        color: Colors.pinkAccent,
                        alignment: Alignment.center,
                        child:Text(widget.list[widget.index],
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },)
            ),

            Container(
              height: 60,
              color: Colors.pinkAccent,
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {
                    String copytext = widget.list[widget.index];

                    FlutterClipboard.copy(copytext).then(( value ) {
                      Fluttertoast.showToast(
                          msg: "msg copied",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }, icon: Icon(Icons.copy),),

                  IconButton(onPressed: () {
                    setState(() {
                      if(widget.index>0)
                      {
                        widget.index--;
                      }
                      else
                      {
                        widget.index = widget.list.length-1;
                      }
                      pageController!.jumpToPage(widget.index);
                    });
                  }, icon: Icon(Icons.arrow_back),),

                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return four(widget.list,widget.index);
                      },
                      ));
                    }, icon: Icon(Icons.design_services),),

                  IconButton(onPressed: () {
                    setState(() {
                      if(widget.index<widget.list.length-1)
                      {
                        widget.index++;
                      }
                      else
                      {
                        widget.index = 0;
                      }
                      pageController!.jumpToPage(widget.index);
                    });
                  }, icon: Icon(Icons.arrow_forward),),

                  IconButton(onPressed: () {

                    String copytext = widget.list[widget.index];

                    Share.share(copytext);

                  }, icon: Icon(Icons.share),),
                ],
              ),
            ),
          ],
        )
    );
  }
}




