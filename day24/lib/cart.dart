import 'package:day24/model.dart';
import 'package:day24/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartDemo extends StatefulWidget {
  CartDemo({super.key, this.mycartList});
  List<Product>? mycartList;

  @override
  State<CartDemo> createState() => _CartDemoState();
}

class _CartDemoState extends State<CartDemo> {
  var total;
  void getTotal() {
    total = widget.mycartList!
        .map((item) => item.price!.toInt() * item.quantity)
        .reduce((value, element) => value + element);
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.mycartList!.length > 0 ? getTotal() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Total item: ${widget.mycartList!.length}"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.mycartList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    height: size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("${widget.mycartList![index].img}"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.mycartList![index].name}",
                                  style:
                                      mystyle(18, textdarkClr, FontWeight.w700),
                                ),
                                Text("${widget.mycartList![index].details}"),
                                Text(
                                  "\$ ${widget.mycartList![index].price!.toInt() * widget.mycartList![index].quantity}",
                                  style:
                                      mystyle(17, textdarkClr, FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                  widget.mycartList!.removeAt(index);
                                },
                                icon: Icon(Icons.delete)),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      getTotal();
                                      setState(() {});
                                      widget.mycartList![index].quantity > 0
                                          ? widget.mycartList![index].quantity--
                                          : widget.mycartList!.removeAt(index);
                                    },
                                    icon: Icon(Icons.remove)),
                                Text("${widget.mycartList![index].quantity}"),
                                IconButton(
                                    onPressed: () {
                                      getTotal();
                                      setState(() {});
                                      widget.mycartList![index].quantity++;
                                    },
                                    icon: Icon(Icons.add)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                color: buttonClr,
                child: Text(
                  "Total price: \$ ${total ?? 0}",
                  style: mystyle(20, Colors.white, FontWeight.w700),
                ))
          ],
        ),
      ),
    );
  }
}
