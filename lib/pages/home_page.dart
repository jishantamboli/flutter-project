import 'package:NearMe/main.dart';
import 'package:NearMe/widget/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:NearMe/core/store.dart';
import 'package:NearMe/models/cart.dart';
import 'dart:convert';
import 'package:NearMe/models/catelog.dart';
import 'package:NearMe/utils/routes.dart';
import 'package:NearMe/widget/drawer.dart';
import 'package:NearMe/widget/home_widgets/catelog_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _ScaffoldKey = new GlobalKey();

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    LoadData();
  }
  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");

    // final response = await http.get(Uri.parse(url));
    // final catelogJson = response.body;
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  ScaffoldState? get currentState {}

  Future<void> Onrefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }

  int activeIndex = 0;

  // final punecity = Image.asset("assets/images/pune night.jpeg");
  final urlImages = [
    'https://images.unsplash.com/photo-1553064676-d48ff008ab2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHVuZSUyMGNpdHl8ZW58MHx8MHx8&w=1000&q=80',
    'https://youimg1.tripcdn.com/target/100i0s000000hi8r7A037_C_640_320_Q70.jpg_.webp?proc=source%2Ftrip',
    'https://i.ndtvimg.com/i/2015-05/kumbh-mela-nashik_650x400_61430833646.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/04/aa/26/b8/navratri-festival-in.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, Removemutation]);
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        // automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {
            if (_ScaffoldKey.currentState != null) {
              return _ScaffoldKey.currentState!.openDrawer();
            } else {
              //  _ScaffoldKey.currentState!.openEndDrawer();
            }
            //   // if (_ScaffoldKey.currentState!.isDrawerOpen == false) {
            //   //   _ScaffoldKey.currentState!.openDrawer();
            //   // }else{
            //   //      _ScaffoldKey.currentState!.openEndDrawer();
            //   // }
          },
        ),
        title: Text(
          "NearMe",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ).pOnly(left: 60.0),
        backgroundColor: MyTheme.redtheme,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search)),
          Padding(
            padding: const EdgeInsets.all(10.0),
          )
        ],
        // bottom: PreferredSize(
        //     child: Padding(
        //       padding: const EdgeInsets.all(0),
        //       // child: TextField(
        //       //   decoration: InputDecoration(
        //       //     hintText: 'search',
        //       //     // prefixIcon: Icon(CupertinoIcons.search),
        //       //     border: OutlineInputBorder(
        //       //       borderRadius: BorderRadius.circular(34),
        //       //       borderSide: BorderSide.none,
        //       //     ),
        //       //     contentPadding: EdgeInsets.zero,
        //       //     filled: true,
        //       //     fillColor: Colors.white,
        //       //   ),
        //       // ),
        //     ),
        //     preferredSize: Size.fromHeight(0)),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        child: Icon(
          CupertinoIcons.cart,
          color: MyTheme.redtheme,
        ),
      ).badge(
          color: MyTheme.redtheme,
          size: 22,
          count: _cart.items.length,
          textStyle:
              // ignore: prefer_const_constructors
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
        onRefresh: Onrefresh,
        child: SafeArea(
          key: _ScaffoldKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  CarouselSlider.builder(
                      itemCount: urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlImages[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  buildIndicator().py2(),
                ],
              ))),
              if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                // ignore: prefer_const_constructors
                CatelogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
              // CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      //  drawer: MyDrawer(),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        width: 400,
        height: 200,
        color: Colors.red.shade50,
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: WormEffect(
            activeDotColor: MyTheme.redtheme,
            dotHeight: 5,
            dotWidth: 5,
            dotColor: Colors.white),
      );
}

class DataSearch extends SearchDelegate<String> {
  final cities = ["Ahmednagar", "Mumbai", "chennai","Hyadrabad","Nagpur","Lonavala","Kokan","Dhule"];
  final recentcities = ["Pune", "Ahmdenagar","Nashik"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
            size: 25,
            color: Colors.black
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
          color: Colors.black
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Colors.black;
    final SuggestionList = query.isEmpty ? recentcities : cities;

    return Container(
      height: double.infinity,
      width: 500,
      color: Colors.white,
      child: ListView.builder(itemBuilder: (context,index) =>
       ListTile(
         leading: Icon(Icons.location_city),
         title: Text(SuggestionList[index]),
       ),
       itemCount: SuggestionList.length,
       )
    );
    //  ListView.builder(
    //   itemBuilder: (context, index) =>
    //    ListTile(
    //     tileColor: Colors.amber,
    //     shape: Border.all(width: 50, color: Colors.white, style: BorderStyle.solid),
    //       leading: Icon(Icons.location_city),
    //       title: Text(SuggestionList[index])),
    //   itemCount: SuggestionList.length,
    // );
  }
}
