import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayari/one.dart';

void main()
{
  runApp(MaterialApp(
    home:splash(),
  )
  );
}



class splash extends StatefulWidget {

  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkpermission();

  }

  checkpermission()
  async {
    var status1 = await Permission.storage.status;
    var status2 = await Permission.camera.status;

    if(status1.isDenied || status2.isDenied)
    {
      await[Permission.storage,Permission.camera].request();
    }

    await Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return one();
      },));
    } );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}


// class demo extends StatefulWidget {
//   const demo({Key? key}) : super(key: key);
//
//   @override
//   _demoState createState() => _demoState();
// }
//
// class _demoState extends State<demo> {
//
//   int a = 10;
//   String name = "abc";
//   List<int> list = [1,2,3];
//   bool status = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("first"),
//       ),
//       body: Center(
//         child: ElevatedButton(onPressed: () {
//
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return demo1(a,name,list,status);
//           },));
//
//         }, child: Text("next")),
//       ),
//     );
//   }
// }
//
// class demo1 extends StatefulWidget {
//
//   int a;
//   String name;
//   List<int> list;
//   bool status;
//
//   demo1(this.a, this.name,this.list, this.status);
//
//
//   @override
//   _demo1State createState() => _demo1State();
// }
//
// class _demo1State extends State<demo1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("second"),
//       ),
//       body: Column(
//         children: [
//           Text("${widget.a}"),
//           Text("${widget.name}"),
//           Text("${widget.list}"),
//           Text("${widget.status}")
//         ],
//       ),
//     );
//   }
// }


