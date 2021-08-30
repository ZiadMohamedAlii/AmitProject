import 'package:flutter/material.dart';

import 'AmitDetailPage.dart';
import 'FontsPage/Fonts.dart';


class Cart extends StatefulWidget {


  @override

  _CartState createState() => _CartState();
}
var CartItems =[];

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Cart',style:MensCategorieTitle,
        ),
    ),
      body: ListView.builder(
        itemCount: CartItems == null ? 0 : CartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            // Within the `FirstRoute` widget
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>AmitDetailpage(
                    name: CartItems[index].name,
                    avatar: CartItems[index].avatar,
                    price: CartItems[index].price,
                    title: CartItems[index].title,
                  )));
            },
            child: Card(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            NetworkImage(CartItems[index].avatar.toString()),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: Text(
                          CartItems[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'EGP ' + CartItems[index].price.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      Row(
                          children:[
                            SizedBox(width:200 ),
                            IconButton(
                                onPressed: () {
                                 setState(() {
                                   CartItems.remove(CartItems[index]);
                                 });
                                },
                                icon:Icon(Icons.remove_circle_outline,color: Colors.red,)),
                          ]
                      )


                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}
