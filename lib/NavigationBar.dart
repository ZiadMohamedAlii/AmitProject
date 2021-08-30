import 'package:amitproject/Cart.dart';
import 'package:amitproject/CategoryPages/AmitCategories.dart';
import 'package:amitproject/Home.dart';
import 'package:flutter/material.dart';





class NaviBar extends StatefulWidget {

  @override
  _NaviBarState createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {


  int myCurrentindex = 0;

  List<Widget> myscreens =[
    Home(),
    AmitCategories(),
    Cart(),


  ];

  List<Text> Mytitle=[
    Text('home'),
    Text('Categories'),
    Text('Cart'),


  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(onTap: (index){
          setState(() {
            myCurrentindex=index;
          });

        },backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,

          currentIndex: myCurrentindex,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home), label: 'Home',
                ),
            BottomNavigationBarItem(icon:Icon(Icons.category), label: 'Categories',
                ),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart), label: 'Cart',
            ),
          ],

        ),

        body:myscreens[myCurrentindex],
      ),
    );
  }
}

