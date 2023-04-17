
import 'package:flutter/material.dart';
import 'package:flutter_sahibinden_clone/constant/colors.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sahibinden.com",style: TextStyle(fontSize: 22),),
        backgroundColor: bgColor,
        actions: [
          SizedBox(width:20,height:20,child: Image.asset("resimler/insan.png")),
          SizedBox(width: 30,),
          SizedBox(width:30,height:30,child: Image.asset("resimler/carcam.png")),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Container(

            child:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black12), //<-- SEE HERE
                    ),
                  hintText: "Kelime veya ilan No. ile ara",
                  hintStyle: TextStyle(fontSize: 18,color: Colors.black54),

                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mic_none,color: Colors.black54,),
                      SizedBox(width: 7,),
                      Icon(Icons.qr_code,color: Colors.black54,),
                      SizedBox(width: 10,),
                    ],
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.black38,)
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12,width: 0.1),
              color: araColor,
            ),
          ),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text("Başlık"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bgColor,
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
