import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์"),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: FutureBuilder(
              builder: (context, snapshot) {
                var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    // return Card(
                    //     child: ListTile(
                    //   leading: FlutterLogo(),
                    //   title: Text(data[index]['title']),
                    //   onTap: () {
                    //     print("Title: ${data[index]['title']} ");
                    //   },
                    // ));
                    return MyBox(data[index]['title'], data[index]['subTitle'],
                        data[index]['imgUrl'], data[index]['detail']);
                  },
                  itemCount: data.length,
                );
              },
              future:
                  DefaultAssetBundle.of(context).loadString('assets/data.json'),
            )));
  }

  Widget MyBox(String title, String subTitle, String urlImg, String detail) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
      //color: Colors.blue[50],
      height: 190,
      decoration: BoxDecoration(
        // color: Colors.blue[50],
        image: DecorationImage(
            image: NetworkImage(urlImg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {
              // print("Next Page...");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(title, subTitle, urlImg, detail)));
            },
            child: Text(
              "อ่านต่อ..",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
