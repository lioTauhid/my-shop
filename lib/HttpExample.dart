import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkExample extends StatefulWidget {
  const NetworkExample({Key? key}) : super(key: key);

  @override
  _NetworkExampleState createState() => _NetworkExampleState();
}

class _NetworkExampleState extends State<NetworkExample> {
  var data= "no data";
  TextEditingController controller=TextEditingController();
  
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
            TextField(
              decoration: InputDecoration(
                hintText: "Type URL",
                border: OutlineInputBorder()
              ),
              controller: controller,
            ),
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
            Divider(thickness: 2,),
            Text(data)
          ],
        ),
      ),
    );
  }
}
