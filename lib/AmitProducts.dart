import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'AmitDetailPage.dart';
import 'AmitProductList.dart';
import 'Cart.dart';
import 'FontsPage/Fonts.dart';



class AmitProducts extends StatefulWidget {

  final int catId;
  final String CategoryName ;
  AmitProducts({required this.catId,
  required this.CategoryName});

  @override
  AmitProductsState createState() => new AmitProductsState(CategoryName);
}

class AmitProductsState extends State<AmitProducts> {
  List data = [];
  List filterData =[];
  dynamic test;
  List d = [];
  String CategoryName ='';


  AmitProductsState(this.CategoryName);

  Future<String> getData() async {
    print('get data started');
    var response = await http.get(
      Uri.parse("https://retail.amit-learning.com/api/products"),
      // headers: {
      //   "Accept": "application/json"
      // }
    );
    print(response.statusCode);
    this.setState(() {
      test = jsonDecode(response.body);
    });

    //print(test.runtimeType);
    d = test['products'];
    for (final h in d) {
      data.add(Product.fromJson(h));
    }
    filterData = data.where((element) => element.category_id == widget.catId).toList();
    print(" data new length${data.length}");
    print(" data new length${filterData.length}");
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.black,
         appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(CategoryName
            ,style:MensCategorieTitle,
          ),
          leading:GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Icon(
                Icons.arrow_back_ios
            ),
          )
      ),
        body: Builder(builder: (context){

        return ListView.builder(
          itemCount: data == null ? 0 : filterData.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              // Within the `FirstRoute` widget
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>AmitDetailpage(
                      name: filterData[index].name,
                      avatar: filterData[index].avatar,
                      price: filterData[index].price,
                      title: filterData[index].title,
                    )));
                CartDetail.add(filterData[index]);
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
                              NetworkImage(filterData[index].avatar.toString()),
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
                            filterData[index].title,
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
                              'EGP ' + filterData[index].price.toString(),
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
                                    CartItems.add(filterData[index]);
                                    SnackBar mySnackBar =
                                        SnackBar(backgroundColor: Colors.white,
                                            duration:Duration(seconds: 1),
                                            content: Text('Item Add To Cart',style:snackbar,));
                                    Scaffold.of(context).showSnackBar(mySnackBar);

                                  },
                                  icon:Icon(Icons.shopping_cart,color: Colors.red,)),
                            ]
                        )


                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );

        })
      ),
    );
  }
}
