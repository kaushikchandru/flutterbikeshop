import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        fontFamily: 'avenir',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedButton = "All";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color(0xfff5f6fa),
     body:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left:30),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Stack(
                      children: <Widget>[
                        Text("Bike", style: TextStyle(
                          color: Color(0xfff1f0f5),
                          fontSize: 90,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:40),
                          child: Text("Bike Shop", style:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                          )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                    ),
                    width: MediaQuery.of(context).size.width*0.25,
                    height: 150,
                    child: IconButton(
                      padding: EdgeInsets.only(top: 40),
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 RotatedBox(
                   quarterTurns: 3,
                   child: Padding(
                     padding: EdgeInsets.only(top: 10),
                     child: Row(
                       children: <Widget>[
                         title("All"),
                         title("Kids"),
                         title("Men"),
                         title("Woman"),
                       ],
                     ),
                   ),
                 )
               ],
             ),
             SizedBox(width: 20,),
             Container(
               height: MediaQuery.of(context).size.height*0.85,
               child: SingleChildScrollView(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text("New Arrival", style: TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.w900,

                           ),),
                           SizedBox(height: 10,),
                           Container(
                             height: 380,
                             width: MediaQuery.of(context).size.width*0.8,
                             child: ListView(
                               physics: BouncingScrollPhysics(),
                               scrollDirection: Axis.horizontal,
                               children: <Widget>[
                                 newArrivalWidget("24A", "400W", "30Km", "\$150"),
                                 SizedBox(width: 15,),
                                 newArrivalWidget("22A", "300W", "25Km", "\$120"),
                                 SizedBox(width: 15,),
                                 newArrivalWidget("20A", "320W", "27Km", "\$150"),
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Text("Best Sellers", style: TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.w900,
                           ),),
                           Container(
                             height: 300,
                             width: MediaQuery.of(context).size.width*0.8,
                             child: ListView(
                               physics: BouncingScrollPhysics(),
                               scrollDirection: Axis.horizontal,
                               children: <Widget>[
                                 bestSellerWidget("YXT Bike", "Prospero", "\$110"),
                                 SizedBox(width: 15,),
                                 bestSellerWidget("XHT Bike", "Rero", "\$140"),
                                 SizedBox(width: 15,),
                                 bestSellerWidget("TYT Bike", "Mount", "\$120"),
                                 SizedBox(width: 15,),
                               ],
                             ),
                           ),

                         ],
                       )
                     ],
                   ),
                 ),
               ),
             )
           ],
         )
       ],
     )

    );
  }
  Container title(String titleName)
  {
    return Container(
      width: 100,
      padding: EdgeInsets.only(right: 20),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Container(
              height: titleName == selectedButton ? 3 : 0,
              color: Colors.black,
            ),
            Text(titleName, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: titleName == selectedButton ? Colors.black : Colors.black45,
            ),
            )
          ],
        ),
        onTap:()
        {
          selectedButton = titleName;
          setState(() {

          });
        },
      ),
    );
  }
  Container bestSellerWidget(String bikeName, String companyName, String price)
  {
    return  Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 0.5,
            spreadRadius: 0.5,
          )]
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/cycles/cycle2.jpg'),
                      fit: BoxFit.contain
                  )
              ),
            ),
            Text(bikeName, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            Text(companyName, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal
            ),),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(price, style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(width: 15,),
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Container newArrivalWidget(String battery, String enginePower, String distance, String price)
  {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 0.5,
            spreadRadius: 0.5,
          )]
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text("All Terrain", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Container(
              padding:EdgeInsets.all(30),
              child: Center(
                child: Image.asset('assets/cycles/cycle1.jpg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(battery, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5,),
                      Text("Battery", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),)
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(enginePower, style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height:5,
                      ),
                      Text("Engine", style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(distance, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5,),
                      Text("Distance", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(price, style:TextStyle(
                    fontSize: 22,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold
                )),
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.add_shopping_cart),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
