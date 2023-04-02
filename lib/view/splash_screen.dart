import 'package:flutter/material.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://image.spreadshirtmedia.com/image-server/v1/mp/compositions/T812A231PA3140PT17X19Y81D1008382170FS7537/views/1,width=378,height=378,backgroundColor=F2F2F2/unsad.jpg"),
            SizedBox(
              height: 20,
            ),
            Text(
              "MEME APP",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
