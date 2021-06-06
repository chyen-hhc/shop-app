import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/data/models/Cart.dart';
import 'package:shop_app/data/models/Product.dart';

import '../../../src/resources/size_config.dart';
import 'cart_card.dart';

List<Cart> chosenCard = [];

void addToCart(Product productChosen) {
  Cart t = Cart(product: productChosen, numOfItem: 1);
  chosenCard.add(t);
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    if (chosenCard.length == 0) {
      return Container(
        child: Text('Your cart is empty.'),
      );
    } else {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: chosenCard.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(chosenCard[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  chosenCard.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: chosenCard[index]),
            ),
          ),
        ),
      );
    }
  }
}
