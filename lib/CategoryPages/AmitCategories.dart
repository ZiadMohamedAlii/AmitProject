import 'dart:async';
import 'dart:convert';
import 'package:amitproject/AmitProducts.dart';
import 'package:amitproject/FontsPage/Fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../AmitProductList.dart';


class AmitCategories extends StatefulWidget {
  @override
  AmitCategoriesState createState() => new AmitCategoriesState();
}

class AmitCategoriesState extends State<AmitCategories> {

  List data1 = [];
  dynamic test1;
  List d1 = [];
  Future<String> getData() async {
    print('get data started');
    var response = await http.get(
      Uri.parse("https://retail.amit-learning.com/api/categories?fbclid=IwAR3876siPmg7RIPza7Rk3GT2waV5yYHZZ63FD8-nfXsWj1NkeekyMHOKmNU"),
      // headers: {
      //   "Accept": "application/json"
      // }
    );
    print(response.statusCode);
    this.setState(() {
      test1 = jsonDecode(response.body);
    });

    //print(test.runtimeType);
    d1 = test1['categories'];
    for(final h in d1 ){
      data1.add(categories.fromJson(h));

    }
    // for(int i = 0 ; i< list.lenght ; i++){
    //   list[i];
    // }
    print(" data new length${data1.length}");
    // for(final dd in data){
    //   print(dd);
    // }

    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black
        ,appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Category'
          ,style:MensCategorieTitle,
        ),
      ),
        body: GridView.builder(
          itemCount: data1 == null ? 0 : data1.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (context, index)=> InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AmitProducts(catId: data1[index].id,
                        CategoryName: data1[index].name),
                  ));
            },
            child: Container(
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(rect),
                          blendMode: BlendMode.darken,
                          child: Image.network(data1[index].avatar.toString(),
                            height: 188.2,
                            width: 188.2,
                            fit: BoxFit.cover,),

                        ),
                        Container(
                          height: 188,

                          child: Align(
                              alignment: Alignment.center,
                              child: Text(data1[index].name.toString(),style: Amit,)),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
