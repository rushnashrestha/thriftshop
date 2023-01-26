import 'package:flutter/material.dart';
import 'package:thrift/pages/cartpage.dart';
import 'package:thrift/pages/home_page.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  DetailPage({required this.image, required this.name, required this.price});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;
  Widget _buildSuzeProduct({required String name}) {
    return Container(
      height: 60,
      width: 60,
      color: Colors.black12,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
    color: Color(0xFF4C53A5),
    fontWeight: FontWeight.bold,
  );

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 350,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/${widget.image}"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameDescription() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              Text(
                "Rs.${widget.price}",
                style: myStyle,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      height: 130,
      width: 380,
      child: Wrap(
        children: <Widget>[
          Text(
            "Beach shorts are THE key for a summer near the beach.",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            "Qualtiy: Good(only word 1time)",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartSized() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildSuzeProduct(name: "L"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          "Quantity",
          style: myStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 99, 108, 209),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.white70,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white70,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButton() {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Check Out'),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          textStyle: TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
          side: BorderSide(width: 1, color: Colors.white70.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => CartPage(
                  name: widget.name,
                  image: widget.image,
                  price: widget.price)));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xFF4C53A5),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 1000,
                  child: Column(
                    children: <Widget>[
                      _buildImage(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildNameDescription(),
                            _buildDescription(),
                            _buildPartSized(),
                            _buildQuantityPart(),
                            SizedBox(
                              height: 20,
                            ),
                            _buildElevatedButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
