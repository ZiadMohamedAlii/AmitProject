
import 'package:flutter/material.dart';

class HomeProductpage extends StatefulWidget {
  final String name ;
  final String img ;
  final String price ;
  final String from_price ;


  HomeProductpage({
    required this.name,
    required this.img,
    required this.price,
    required this.from_price});

  @override
  _HomeProductpageState createState() => _HomeProductpageState();
}
class _HomeProductpageState extends State<HomeProductpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
                      image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.cover)
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
                    Text(widget.name,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: <Widget>[
                    Text("Price :",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    ),),
                    SizedBox(width: 20,),
                    Row(
                      children: <Widget>[
                        Text(widget.price+" USD",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 20,),
                        Text(widget.from_price+" USD",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70,),
              InkWell(
                onTap: (){
                  // your add cart function here
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
              )            ],

          )
      ),
    );
  }
}
