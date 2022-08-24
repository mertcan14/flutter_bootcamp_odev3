import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odev3/renkler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const[
        Locale("en", ""),
        Locale("tr", "")
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var size,height,width, padding;
  int secili_sayfa = 0;

  void sayfaDegister(int index){
    setState(() {
      secili_sayfa = index;
    });
  }

  var featured = [
    {"title": "Modernica Apartment", "address": "New York, US", "priceBrim": "\$ 29", "score": "4.8", "image": "images/apartman2.png"},
    {"title": "Modernica Villa", "address": "Bolu, TR", "priceBrim": "\₺ 1500", "score": "5.0", "image": "images/villa1.png"},
    {"title": "Nature Home", "address": "Manchester, EN", "priceBrim": "\$ 150", "score": "4.9", "image": "images/naturehome.png"}
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    padding = MediaQuery.of(context).viewPadding;
    var d = AppLocalizations.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: secili_sayfa,
        onTap: sayfaDegister,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: yardimciRenk,),
            title: new Text(d!.anaSayfa),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: yardimciRenk,),
            title: new Text(d.arama),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: yardimciRenk,),
            title: new Text(d.begeni),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: yardimciRenk,),
            title: new Text(d.mesaj),
          ),
        ],
        selectedItemColor: yardimciRenk,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:height*6/100, left: width*2/100, right: width*2/100, bottom: height*3/100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/woman.png'),
                    radius: height*5/100,
                  ),
                  Column(
                    children: [
                      Text(d.gunaydin, style: TextStyle(color: yaziRenk2, fontFamily: "DynaPuff")),
                      Text("Andrew Ainsley", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: yaziRenk1),)
                    ],
                  ),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.notifications),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height/100, bottom: height/100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(d.ozellikli, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: yaziRenk1),),
                    Text(d.hepsiniGor, style: TextStyle(fontSize: 16, color: yardimciRenk),)
                  ],
                ),
              ),

              CarouselSlider.builder(
                options: CarouselOptions( height: height*5.5/10),
                itemCount: featured.length,
                itemBuilder: (context, index, realIndex){
                  var featuredOnce = featured[index];
                  return Container(
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(featuredOnce["image"]!, fit: BoxFit.cover, width: width*6.5/10,)
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height*11/100),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(featuredOnce["title"]!, style: TextStyle(color: anaRenk, fontWeight: FontWeight.bold, fontSize: 16),)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height*8/100),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(featuredOnce["address"]!, style: TextStyle(color: anaRenk),)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height*4/100),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Text(featuredOnce["priceBrim"]!, style: TextStyle(color: anaRenk, fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text(d.gece, style: TextStyle(color: anaRenk,),),
                                ],
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height*4/100, right: width*1.25/10),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: width*13/100,
                                decoration: BoxDecoration(
                                    color: yaziRenk2,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amberAccent,),
                                    Text(featuredOnce["score"]!, style: TextStyle(color: anaRenk,),),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: height*2/100, bottom: height/100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(d.bizimOnerilerimiz, style: TextStyle(color: yaziRenk1, fontWeight: FontWeight.bold,  fontSize: 16),),
                    Text(d.hepsiniGor, style: TextStyle(color: yardimciRenk,  fontSize: 16),)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: yardimciRenk,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    onPressed: (){

                    },
                    child: Text(d.hepsi, style: TextStyle(color: anaRenk),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: yardimciRenk,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                    onPressed: (){

                    },
                    child: Text(d.ev, style: TextStyle(color: anaRenk),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: yardimciRenk,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                    onPressed: (){

                    },
                    child: Text("Villa", style: TextStyle(color: anaRenk),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: yardimciRenk,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                    onPressed: (){

                    },
                    child: Text(d.apartman, style: TextStyle(color: anaRenk),),
                  )
                ],
              ),
              Row(
                children: [
                  Home(
                    title: "Alpha Housing",
                    price: "\$25",
                    address: "Tokyo, Japan",
                    score: "4.8",
                    image: "images/apartman4.jpg",
                    night: d.gece,
                  ),
                  Home(
                    title: "La Grand Maison",
                    price: "\$40",
                    address: "Delhi, India",
                    score: "5.0",
                    image: "images/apartman1.png",
                    night:d.gece
                  ),
                ],
              ),
              Row(
                children: [
                  Home(
                    title: "Alpha Housing",
                    price: "\$25",
                    address: "Tokyo, Japan",
                    score: "4.8",
                    image: "images/naturehome1.jpg",
                    night: d.gece,
                  ),
                  Home(
                    title: "La Grand Maison",
                    price: "\$40",
                    address: "Delhi, India",
                    score: "5.0",
                    image: "images/apartman3.png",
                    night: d.gece,
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class Home extends StatelessWidget {
  final String title;
  final String address;
  final String score;
  final String price;
  final String image;
  final String night;

  Home({required this.title, required this.price, required this.address, required this.score, required this.image, required this.night});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var padding = MediaQuery.of(context).viewPadding;
    return SizedBox(
      width: (width*5/10)-(width*2/100),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(left:10.0, right: 10.0, top: 10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: (width*4/10),
                      height: (height/5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(this.image, fit: BoxFit.fill,)
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*1/100, right: width*0.1/10),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: width*13/100,
                          decoration: BoxDecoration(
                              color: yaziRenk2,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.amberAccent,),
                              Text(this.score, style: TextStyle(color: anaRenk,),),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.address, style: TextStyle(color: yaziRenk2),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(this.price, style: TextStyle(fontSize: 15, color: yardimciRenk, fontWeight: FontWeight.bold),),
                      Text(this.night, style: TextStyle( color: yaziRenk2),)
                    ],
                  ),
                  Icon(Icons.favorite_border, color: yardimciRenk,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

