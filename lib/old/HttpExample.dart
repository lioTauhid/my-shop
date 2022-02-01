import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkData extends StatefulWidget {
  const NetworkData({Key? key}) : super(key: key);

  @override
  _NetworkDataState createState() => _NetworkDataState();
}

class _NetworkDataState extends State<NetworkData> {
  TextEditingController controller=TextEditingController();
  late var data="no data";

  void fetchData(String url){
      var response= http.get(Uri.parse(url));
      response.then((value) {
        setState(() {
          data= value.body;
        });
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData("https://jsonplaceholder.typicode.com/posts/1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Type Url",
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                fetchData(controller.text);
              },
              height: 50,
              minWidth: 200,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Get Data",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            const Divider(thickness: 2,),
            SizedBox(height: 20,),
            Text(data)
          ],
        ),
      ),
    );
  }
}
