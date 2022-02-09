// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   TextEditingController controller= TextEditingController();
//   var localData= GetStorage();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() {
//       controller.text= localData.read("name");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         height: Size.infinite.height,
//         width: Size.infinite.width,
//         color: Colors.blueGrey,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(100),
//               child: Image.network(
//                   "https://st3.depositphotos.com/4060975/17730/v/1600/depositphotos_177308034-stock-illustration-boss-vector-icon.jpg",
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.fill),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//               "Name : ${controller.text}",
//               style: TextStyle(fontSize: 20, color: Colors.white),
//             ),
//             Text(
//               "Profession : Md Tauhid",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//             Text(
//               "Phone Number : Md Tauhid",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//             Text(
//               "Eamil : Md Tauhid",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//               onPressed: () {
//                 showMyDialog(context);
//               },
//               color: Colors.teal,
//               child: Text("Update Profile"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> showMyDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Profile update'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "User Name"
//                   ),
//                   controller: controller,
//                 )
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Confirm'),
//               onPressed: () {
//                 // save data
//                 localData.write("name", controller.text);
//                 setState(() {});
//                 Navigator.of(context).pop();
//
//                 print(localData.read("name"));
//               },
//             ),
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
