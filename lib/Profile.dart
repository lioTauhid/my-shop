import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controller=TextEditingController();
  String name= "";
  var localData= GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      name= localData.read("userName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        child: Column(
          children: [
            SizedBox(height: 30,),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:Image.network("https://1.bp.blogspot.com/-bUpvvgWGySY/YSo45ofhjhI/AAAAAAAAWKY/zXWOk0hTWycsJ5wKDP25rb53MolixAzUwCLcBGAsYHQ/s0/cute-dp-images-cute-profile-pictures%2B%252817%2529.jpg",
              height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 40,),
            Text("User Name : ${name}", style: TextStyle(fontSize: 20),),
            Text("Phone Number : Md Tauhid", style: TextStyle(fontSize: 16),),
            Text("Email : Md Tauhid", style: TextStyle(fontSize: 16),),
            Text("Address : Md Tauhid", style: TextStyle(fontSize: 16),),
            SizedBox(height: 40,),
            MaterialButton(onPressed: (){
              showMyDialog(context);
            },
            child: Text("Update Profile"),
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profile update'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "User Name"
                  ),
                  controller: controller,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                // save data
                localData.write("userName", controller.text);
                setState(() {
                  name= controller.text;
                });
                Navigator.of(context).pop();
                print(localData.read("userName"));
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
