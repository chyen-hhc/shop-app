import 'package:flutter/material.dart';
import 'package:shop_app/data/models/Cart.dart';

import '../../../src/resources/constants.dart';
import '../../../src/resources/size_config.dart';

class CartCard extends StatefulWidget {
  CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  Cart cart;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int numOfItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: "\$${widget.cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: kPrimaryColor),
                    children: [
                      TextSpan(
                          text: "Total:",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: kPrimaryColor))
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            numOfItem = numOfItem == 0 ? 0 : numOfItem - 1;
                          });
                        },
                        child: Icon(Icons.remove)),
                    Text(" ${numOfItem}"),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            numOfItem++;
                          });
                        },
                        child: Icon(Icons.add))
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
