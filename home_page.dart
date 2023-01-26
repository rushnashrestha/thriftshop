import 'package:flutter/material.dart';
import 'package:thrift/pages/detail.dart';
import 'package:thrift/pages/list_product.dart';
import 'package:thrift/widgets/signedproduct.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct(String image) {
    return CircleAvatar(
      maxRadius: 45,
      backgroundColor: Color(0xFF4C53A5),
      child: Image(
        image: AssetImage("images/$image"),
        height: 45,
        color: Colors.white70,
      ),
    );
  }

  bool homeColor = true;

  bool cartColor = true;

  bool aboutColor = true;

  bool contactusColor = true;

  Widget _buildMyDrawer() {
    return Drawer(
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Mark Lee",
                style: TextStyle(
                  //fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/mark.jpg"),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
              ),
              accountEmail: Text(
                "leemark@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              selected: homeColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  contactusColor = false;
                  cartColor = false;
                  aboutColor = false;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: cartColor,
              onTap: () {
                setState(() {
                  cartColor = true;
                  homeColor = false;
                  aboutColor = false;
                  contactusColor = false;
                });
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
                selected: aboutColor,
                onTap: () {
                  setState(() {
                    aboutColor = true;
                    homeColor = false;
                    cartColor = false;
                    contactusColor = false;
                  });
                },
                leading: Icon(Icons.info),
                title: Text("About")),
            ListTile(
              selected: contactusColor,
              onTap: () {
                setState(() {
                  contactusColor = true;
                  homeColor = false;
                  cartColor = false;
                  aboutColor = false;
                });
              },
              leading: Icon(Icons.phone),
              title: Text("Contact Us"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Carousel(
        autoplay: true,
        dotBgColor: Colors.white70,
        dotSize: 4,
        overlayShadow: true,
        overlayShadowColors: Colors.transparent,
        overlayShadowSize: 0.2,
        images: [
          AssetImage("images/shorts.png"),
          AssetImage("images/sweat.png"),
          AssetImage("images/beach.png"),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            children: <Widget>[
              _buildCategoryProduct("shirt_icon.png"),
              _buildCategoryProduct("pant_icon.png"),
              _buildCategoryProduct("hoodie_icon.png"),
              _buildCategoryProduct("shoes_icon.png"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ListProduct(name: "Featured")));
                }),
                child: Text(
                  'View More',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DetailPage(
                        image: "1.png", price: 3600, name: "Jordan")));
              },
              child: SingleProduct(image: "1.png", price: 3600, name: "Jordan"),
            ),
            // SizedBox(
            //   width: 25,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DetailPage(
                        image: "2.png",
                        price: 1000,
                        name: "Long-sleeve Shirt")));
              },
              child: SingleProduct(
                  image: "2.png", price: 1000, name: "Long-sleeve Shirt"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewArrival() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Arrival',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              ListProduct(name: "New Arrival")));
                    },
                    child: Text(
                      'View More',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailPage(
                            name: "Hoodie", price: 1800, image: "7.png")));
                  },
                  child: SingleProduct(
                    name: "Hoodie",
                    price: 1800,
                    image: "7.png",
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailPage(
                            name: "Black Jogger", price: 700, image: "4.png")));
                  },
                  child: SingleProduct(
                      name: "Black Jogger", price: 700, image: "4.png"),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF4C53A5),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white70),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white70,
              )),
          IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white70),
              onPressed: () {}),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildImageSlider(),
                            _buildCategory(),
                            SizedBox(
                              height: 15,
                            ),
                            _buildFeatures(),
                            _buildNewArrival(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
