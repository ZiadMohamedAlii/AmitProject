
import 'package:flutter/material.dart';

import 'Cart.dart';
import 'FontsPage/Fonts.dart';



class AmitDetailpage extends StatefulWidget {
  final String name ;
  final String avatar;
  final int price;
  final String title;




  AmitDetailpage({
    required this.name,
    required this.avatar,
    required this.price,
    required this.title});

  @override
  _AmitDetailpageState createState() => _AmitDetailpageState();
}

var CartDetail =[];


class _AmitDetailpageState extends State<AmitDetailpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false ,
      home: Scaffold(
        body:Builder(builder: (context){
          return SafeArea(
              child: ListView(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.avatar),fit: BoxFit.contain)
                    ),
                  ),

                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      children:[
                        Text("Name :",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 20,),
                        Text(widget.title,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      children:[
                        Text("Price :",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 20,),
                        Row(
                          children:[
                            Text(widget.price.toString()+" EGY",style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45,),
                  InkWell(
                    onTap: (){
                      CartItems.add(CartDetail.last);
                     SnackBar mySnackBar1 =
                      SnackBar(backgroundColor: Colors.black,
                          duration:Duration(seconds: 1),
                          content: Text('Item Add To Cart',style:snackbar1));
                      Scaffold.of(context).showSnackBar(mySnackBar1);

                    },
                    child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color:Colors.black,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Text("ADD TO CART",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,

                          ),),
                        ),
                      ),),
                  )
                ],
              )
          );
        })
      ),
    );
  }
}
