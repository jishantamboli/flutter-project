import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:flutter_project1/widget/drawer.dart';
import 'package:flutter_project1/widget/home_widgets/catelog_list.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, Removemutation]);
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
        backgroundColor: Colors.red,
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
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search',
                  // prefixIcon: Icon(CupertinoIcons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            preferredSize: Size.fromHeight(56)),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.red,
        ),
      ).badge(
          color: Colors.red,
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
          child: Container(
            padding: Vx.m8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  // ignore: prefer_const_constructors
                  CatelogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
      ),
      //  drawer: MyDrawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = ["Ahmednagar", "Mumbai", "chennai"];
  final recentcities = ["rahuri", "nagar"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final SuggestionList = query.isEmpty ? recentcities : cities;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.location_city),
          title: Text(SuggestionList[index])),
      itemCount: SuggestionList.length,
    );
  }
}
