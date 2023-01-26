import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CheckOut({required this.name, required this.image, required this.price});
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  Widget _buildSingleCart() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/${widget.image}"),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name),
                        //Text("Cloth"),
                        Text(
                          "Rs.${widget.price}",
                          style: TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 99, 108, 209),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Quantity"),
                              Text("1"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomDetail(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          endName,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check Out Page",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF4C53A5),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white70,
            ),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            onPressed: () {},
            child: Text('Buy'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4C53A5),
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                _buildSingleCart(),
                _buildSingleCart(),
                _buildSingleCart(),
                _buildSingleCart(),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomDetail(
                          startName: "Your Price", endName: "Rs. 1,400.0"),
                      _buildBottomDetail(startName: "Discount", endName: "3%"),
                      _buildBottomDetail(
                          startName: "Shipping", endName: "Rs. 50"),
                      _buildBottomDetail(
                          startName: "Total", endName: "Rs. 1,030.0"),
                    ],
                  ),
                ),
                // Wrap(
                //   direction: Axis.horizontal,
                //   children: [
                //       Text("Home"),
                //       Text("Date"),

                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
