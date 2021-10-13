import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({ Key? key }) : super(key: key);
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text(_v1,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(_v2,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Image.network(_v3),
            SizedBox(height: 15),
            Text(_v4,
                style: TextStyle(
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
  }
}
