import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../JsonDataModel.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPage = 0;
  var pageList= [];
  late TabController tabController;
  List<Product> productList= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController= TabController(length: 3, vsync: this);
    initPages();
    getProductsData();
  }

  void getProductsData(){
    var response= http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    response.then((value) {
      setState(() {
        productList=productFromJson(value.body);
      });
      print(productList[2].url);
    });
  }

  void initPages(){
    pageList = [
      Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              LimitedBox(
                maxHeight: 200,
                child: PageView(
                  children: [
                    ImageSliding(
                        'https://media.istockphoto.com/photos/digitally-enhanced-shot-of-a-graph-showing-the-ups-and-downs-shares-picture-id1322201350'),
                    ImageSliding(
                        'https://media.istockphoto.com/photos/person-holds-a-smartphone-with-mobile-banking-icons-projection-picture-id1304484797'),
                    ImageSliding(
                        'https://images.pexels.com/photos/10567313/pexels-photo-10567313.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  topItem("Popular", Icon(Icons.star), Colors.pink),
                  topItem("Flash Sale", Icon(Icons.alarm), Colors.orange),
                  topItem("Evaly Store", Icon(Icons.store), Colors.blue),
                  topItem("Voucher", Icon(Icons.tag), Colors.cyan),
                  topItem("Gift", Icon(Icons.card_giftcard), Colors.red),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TabBar(tabs: [
                Tab(text: "Catagory",),
                Tab(text: "Brand",),
                Tab(text: "Shop",),
              ],
                controller: tabController,
                labelColor: Colors.black,
              ),
              Container(
                height: 220,
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            setTabRowItem("Bag & Luggage", Icons.shopping_bag, Colors.blueGrey),
                            setTabRowItem("Beauty & Body", Icons.accessibility, Colors.cyanAccent),
                            setTabRowItem("Books", Icons.book, Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            setTabRowItem("Burmese Product", Icons.card_giftcard, Colors.redAccent),
                            setTabRowItem("Material", Icons.construction, Colors.orange),
                            setTabRowItem("Decoration", Icons.ac_unit, Colors.purpleAccent),
                          ],
                        ),
                      ],
                    ),
                    Text("tab2"),
                    Text("tab3"),
                  ],
                  controller: tabController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flash Sale"),
                  TextButton(onPressed: (){
                    getProductsData();
                    setState(() {});
                  }, child: Text("Show all"))
                ],
              ),
              SizedBox(
                height: 100,
                child: FutureBuilder(
                  initialData: productList,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return ListView.builder(
                        itemCount: productList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(productList[index].url, height: 80,),
                              Text(productList[index].id.toString()),
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.orange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: TextField(
          autofocus: false,
          decoration: InputDecoration(
              hintText: "What would you like buy?",
              helperStyle: TextStyle(color: Colors.black45),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(50),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              hintStyle: TextStyle(color: Colors.black45),
              prefixIcon: Icon(Icons.search)),
          style: TextStyle(color: Colors.black45, fontSize: 16.0),
          onChanged: (query) => {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black38,
              ))
        ],
      ),
      drawer: Container(),
      body: pageList[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}

class ImageSliding extends StatelessWidget {
  String imageLink;

  ImageSliding(this.imageLink);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageLink,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

Widget topItem(String text, Icon icon, Color color) {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100.0)),
          child: IconButton(icon: icon, color: color, onPressed: () {})),
      Text(text)
    ],
  );
}

Widget setTabRowItem(String type, IconData iconData, Color color) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      children: [
        Container(
            height: 100,
            width: 105,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      iconData,
                      size: 35,
                    ),
                    color: color,
                    alignment: Alignment.topLeft,
                    onPressed: () {}),
                Text(
                  type,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ],
    ),
  );
}


