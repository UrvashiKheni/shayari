
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share/share.dart';

class four extends StatefulWidget {

  List<String> list;
  int index;

  four(this.list, this.index);

  @override
  _fourState createState() => _fourState();
}

class _fourState extends State<four> {

  List<List<Color>> singlecolorlist = [
    [Colors.pink,Colors.pink],
    [Colors.purpleAccent,Colors.purpleAccent],
    [Colors.pinkAccent,Colors.pinkAccent],
    [Colors.deepPurple,Colors.deepPurple],
    [Colors.yellowAccent,Colors.yellowAccent],
    [Colors.yellow,Colors.yellow],
    [Colors.amber,Colors.amber],
    [Colors.black45,Colors.black45],
    [Colors.greenAccent,Colors.greenAccent],
    [Colors.cyanAccent,Colors.cyanAccent],
    [Colors.lightGreenAccent,Colors.lightGreenAccent],
    [Colors.deepOrangeAccent,Colors.deepOrangeAccent],
  ];

  List<String> myemoji = ["💐 🌹 🥀 🌺 🌳 🌴 😍 😅 💜 💖 🌺 🌳 🌴",
    "😆 😅 😂 🤣 💐 🌹 🥀 🌺 🌳 🌴 🌺 🌳 🌴 ",
    "🌹 🥀 🌺 🌻 🌼 🌷 💐 🌹 🥀 🌺 🌳 🌴 ",
    "🌿 ☘ 🍀 🍁 🍂 🍃 💐 🌹 🥀 🌺 🌳 🌴 ",
    "🎄 🎆 🎇 ✨ 🎈 💐 🌹 🥀 🌺 🌳 🌴 ",
    "😚 ☺ 🙂 🤗 🤩 💐 🌹 🥀 🌺 🌳 🌴 ",
    "☹ 🙁 😖 😞 😟 💐 🌹 🥀 🌺 🌳 🌴 ",
    "🤥 🤫 🤭 🧐 🤓 💐 🌹 🥀 🌺 🌳 🌴 ",
    "😸 😹 😻 💐 🌹 🥀 🌺 🌳 🌴 😻 😼 😽",
  ];
  String emoji ='🌹 🥀 🌺 🌻 🌼 🌷 💐 🌹 🥀 🌺 🌳 🌴';


  List<List<Color>> gradientlist = [
    [Colors.pinkAccent,Colors.yellowAccent,Colors.green,Colors.blue],
    [Colors.black,Colors.blueGrey,Colors.redAccent,Colors.green],
    [Colors.black26,Colors.red,Colors.amber,Colors.greenAccent],
    [Colors.indigo,Colors.deepOrangeAccent,Colors.orangeAccent,Colors.grey],
    [Colors.blue,Colors.green,Colors.yellow,Colors.redAccent],
    [Colors.red,Colors.grey,Colors.greenAccent,Colors.limeAccent],
    [Colors.blue,Colors.green,Colors.yellow,Colors.orangeAccent],
    [Colors.purple,Colors.pinkAccent,Colors.amber,Colors.lightGreen],
    [Colors.indigo,Colors.deepOrangeAccent,Colors.orangeAccent],
    [Colors.blue,Colors.green,Colors.yellow,Colors.indigoAccent],
    [Colors.purple,Colors.purpleAccent,Colors.pinkAccent,Colors.pink],
    [Colors.red,Colors.redAccent,Colors.orange,Colors.orangeAccent],
    [Colors.green,Colors.greenAccent,Colors.lime,Colors.limeAccent],
    [Colors.black,Colors.black54,Colors.grey,Colors.blueGrey]
  ];

  List<Color> bggradient = [
    Colors.pinkAccent,Colors.pinkAccent
  ];

  int gradientindex = 0;

  Color textcolor = Colors.black;

  double textsize = 24;

  List<String> myfont = [
    'family1',
    'family2',
    'family3',
    'family4',
    'family5',
    'family6',
    'family7',
    'family8',
    'family9',
    'family10'
  ];

  String font = 'family3';


  GlobalKey globalKey = GlobalKey();

  String folderpath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createfolder();

  }

  createfolder()
  async {
    Directory directory = Directory("storage/emulated/0/Download/shayari 2022");

    if(await directory.exists())
      {
        print("Already exists");
      }
    else
      {
        directory.create();
        print("created");
      }

    folderpath = directory.path;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  RepaintBoundary(
                    key: globalKey,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: bggradient),
                      ),
                      child:Text('$emoji''\n${widget.list[widget.index]}''\n$emoji',
                        style: TextStyle(
                            fontSize: textsize,
                            fontWeight: FontWeight.bold,
                            color: textcolor,
                            fontFamily: font),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
          ),

          Container(
            child: Row(
              children: [
                IconButton(onPressed: () {
                  setState(() {
                    if(gradientindex<=gradientlist.length-1)
                    {
                      bggradient = gradientlist[gradientindex++];
                    }
                    else
                    {
                      gradientindex = 0;
                    }
                  });
                }, icon: Icon(Icons.refresh)),
                IconButton(onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 250,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemCount: gradientlist.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5), itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      bggradient = gradientlist[index];
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: gradientlist[index]
                                      )
                                    ),
                                  ),
                                );
                              },
                              ),
                            ),
                            IconButton(onPressed: () {
                              Navigator.pop(context);
                            }, icon: Icon(Icons.close))
                          ],
                        ),
                      );
                    },);
                }, icon: Icon(Icons.shuffle)),
              ],
            ),
          ),

          Container(
            color: Colors.brown,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: GridView.builder(
                                            itemCount: singlecolorlist.length,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5), itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  bggradient = singlecolorlist[index];
                                                });
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: singlecolorlist[index])
                                                ),
                                              ),
                                            );
                                          },
                                          ),
                                        ),
                                        IconButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, icon: Icon(Icons.close),)
                                      ],
                                    ),
                                  );
                                },);
                            },
                            child: Text("background", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white, backgroundColor: Colors.red,),
                              textAlign: TextAlign.center,),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: ColorPicker(pickerColor: textcolor, onColorChanged: (value) {
                                      setState(() {
                                        textcolor = value;
                                      });
                                    },),
                                  ),
                                );
                              },);
                            },
                            child: Text("Text color", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white, backgroundColor: Colors.red,),textAlign: TextAlign.center,),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              _capturePng().then((value) {
                                print("==${value}==");

                                DateTime dt = DateTime.now();

                                print(dt);

                                String time = "${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}";

                                String imagepath = "$folderpath/Image$time.jpg";

                                File file = File(imagepath);

                                file.writeAsBytes(value);
                                file.create();

                                String path = file.path;
                                Share.shareFiles([path]);
                              });
                            },
                            child: Text("Share", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white, backgroundColor: Colors.red,),textAlign: TextAlign.center,),
                          ),
                        )),

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(context: context, builder:(context) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 250,
                                          child: ListView.builder(
                                            itemCount: myfont.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.only(left: 7,right: 7,bottom: 5,top: 5),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      font = myfont[index];
                                                    });
                                                  },
                                                  child: Text(font =myfont[index],style: TextStyle(fontSize: 30,fontFamily: myfont[index]),textAlign: TextAlign.center,),
                                                ),
                                              );
                                            },
                                          )
                                      ),
                                    ),
                                    IconButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.close,),)
                                  ],
                                );
                              },);
                            },
                            child: Text("Font", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white, backgroundColor: Colors.red,),textAlign: TextAlign.center,),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(context: context, builder:(context) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 250,
                                          child: ListView.builder(
                                            itemCount: myemoji.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.only(left: 7,right: 7,bottom: 5,top: 5),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      emoji = myemoji[index];
                                                    });
                                                  },
                                                  child: Text(emoji =myemoji[index],style: TextStyle(fontSize: 30,),textAlign: TextAlign.center),
                                                ),
                                              );
                                            },
                                          )
                                      ),
                                    ),
                                    IconButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.close,),)
                                  ],
                                );
                              },);
                            },
                            child: Text("Emoji", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white, backgroundColor: Colors.red,),textAlign: TextAlign.center,),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(context: context, builder: (context) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StatefulBuilder(builder: (context, setState1) {
                                      return Expanded(
                                        child: Container(
                                          height: 150,
                                          child: Slider(value: textsize,max: 50,min: 10, onChanged: (value) {
                                            print(value);
                                            setState(() {
                                              setState1((){
                                                textsize = value;
                                              });
                                            });
                                          },),
                                        ),
                                      );

                                    },),
                                    IconButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.close,),)
                                  ],
                                );
                              },
                              );
                            },
                            child: Text("Text size", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white, backgroundColor: Colors.red,),textAlign: TextAlign.center,),
                          ),
                        )),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}