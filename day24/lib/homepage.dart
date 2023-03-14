import 'package:day24/cart.dart';
import 'package:day24/model.dart';
import 'package:day24/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> cartList = [];
  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Total selected item: ${cartList.length}"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                //color: Colors.amber,
                padding:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: cardClr,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Choose \nYour Device",
                              style: mystyle(24, textdarkClr, FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              "images/7.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: cardClr,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("${productList[index].img}"),
                                Column(
                                  children: [
                                    Text(
                                      "${productList[index].name}",
                                      style: mystyle(
                                          18, textdarkClr, FontWeight.bold),
                                    ),
                                    Text("${productList[index].details}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ ${productList[index].price}",
                                      style: mystyle(
                                          18, textdarkClr, FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        try {
                                          cartList.firstWhere((element) =>
                                              element.id ==
                                              productList[index].id);

                                          var snackBar = SnackBar(
                                              content: Text('Already added!'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } catch (e) {
                                          cartList.add(productList[index]);
                                          setState(() {
                                            //isClicked = !isClicked;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.shopping_cart),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              height: size.height * 0.08,
              minWidth: size.width * 0.9,
              color: buttonClr,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartDemo(
                          mycartList: cartList,
                        )));
              },
              child: Text(
                "View Cart",
                style: mystyle(16, Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
