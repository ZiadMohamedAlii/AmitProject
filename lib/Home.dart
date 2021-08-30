
import 'package:amitproject/HomeProductPage.dart';
import 'package:amitproject/ListPage/ListDataPage.dart';
import 'package:amitproject/SignInPage.dart';
import 'package:flutter/material.dart';
import 'FontsPage/Fonts.dart';
import 'Methods/DarwerMethods.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'home...',
            style: homeTitletext,
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Text(
                  'welcome',
                  style: HomeDrawerTitle,
                )),
                SizedBox(
                  height: 10,
                ),
                DrawerItems(
                  Icons.apps,
                  'Rate App',
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItems(
                  Icons.share,
                  'Share App',
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItems(
                  Icons.mail,
                  'Keep N Touch',
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItems(
                  Icons.settings,
                  'Settings',
                ),
                SizedBox(
                  height: 10,
                ),
                      InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },

                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'log out',
                            style: HomeDrawerItems,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'image/2x1_HIM_01_gender.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'image/9260251906078.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'image/2x1_HER_02_gender.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'image/540x300_medusa-w.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'image/WhatsApp Image 2021-07-28 at 11.35.38 PM.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Card(color: Colors.black,
                  child: Row(
                    children: [
                      Text('Fire Deals',style: HomeDealFont,)
                    ],
                  ),

                )
              ],
            ),
            SizedBox(height: 5,),
            Column(
              children: List.generate(items.length, (index) =>
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeProductpage(
                        name: items[index]['name'],
                        img: items[index]['img'],
                        price: items[index]['price'].toString(),
                        from_price: items[index]['from_price'].toString(),
                      )));
                    },
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Hero(
                        tag: items[index]['id'].toString(),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(items[index]['img']),fit: BoxFit.contain)
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items [index]['name'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(items[index]['price'].toString() ,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                ),),
                              SizedBox(width: 20,),
                              Text(items[index]['from_price'].toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough
                                ),),
                            ],
                          ),
                          Row(
                              children:[
                                SizedBox(width:200 ),
                                IconButton(
                                    onPressed: () {
                                    },
                                    icon:Icon(Icons.shopping_cart)),
                              ]
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            )
                ),
          ],
        ),
      ),
    );
  }
}
