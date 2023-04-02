import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_meme/controller/fetch_meme.dart';
import 'package:random_meme/controller/savemydata.dart';

class main_screen extends StatefulWidget {
  main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  String imgUrl = "";
  int? memeno;
  bool isloading = true;
  int targetmeme = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinitmemeno();
    updateimg();
  }

  getinitmemeno() async {
    memeno = await savemydata.fetchdata() ?? 0;
    if (memeno! > 20) {
      targetmeme = 500;
    } else if (memeno! > 500) {
      targetmeme = 1000;
    }
    setState(() {});
  }

  void updateimg() async {
    String getimgurl = await fetch_meme.fetchnewmeme();

    setState(() {
      imgUrl = getimgurl;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "Meme #${memeno.toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Target ${targetmeme} memes"),
            SizedBox(
              height: 30,
            ),
            isloading
                ? Container(
                    child: Center(
                        child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(),
                    )),
                  )
                : Image.network(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                    imgUrl),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  await savemydata.savedata(memeno! + 1);
                  getinitmemeno();
                  updateimg();
                },
                child: Container(
                    height: 50,
                    width: 100,
                    child: Center(
                        child: Text(
                      "more fun",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )))),
            Spacer(),
            Text(
              " App created by",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            Text(
              " Riya sahu",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
