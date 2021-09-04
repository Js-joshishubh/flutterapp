import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract_app/core/store.dart';
import 'package:pract_app/models/cart.dart';
import 'dart:convert';
import 'package:pract_app/models/catalog.dart';
import 'package:pract_app/util/routes.dart';
import 'package:pract_app/widgets/home_widgets/catalog_header.dart';
import 'package:pract_app/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Shubham";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    // await rootBundle.loadString("assets/files/catalog.json");


    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => catalogModel.item[0]);

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) => FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
              backgroundColor: context.theme.buttonColor,
              child: Icon(CupertinoIcons.cart , color: Colors.white,
              ),
            ).badge(color: Vx.green700, size: 22, count: _cart.items.length,
              textStyle: TextStyle(
                color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      ),

      
      
      //With New Velocity_x
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: Text("Catalog App") ,
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
      //     ? GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 16,
      //     crossAxisSpacing: 16,
      //   ),
      //     itemBuilder: (context,index){
      //       final item = CatalogModel.items[index];
      //       return Card(
      //         clipBehavior: Clip.antiAlias,
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //For Grid View         child : GridTile(
      //           header: Container(
      //             child: Text(item.name ,
      //             style: TextStyle(color: Colors.white),
      //             ),
      //             padding: const EdgeInsets.all(12),
      //             decoration: BoxDecoration(
      //               color: Colors.yellow,
      //
      //             ),
      //           ),
      //             child: Image.network(item.imgage),
      //           footer: Container(
      //             child: Text(
      //               item.price.toString(),
      //               style: TextStyle(color: Colors.white),
      //             ),
      //             padding: const EdgeInsets.all(12),
      //             decoration: BoxDecoration(
      //               color: Colors.black45,
      //
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //     itemCount: CatalogModel.items.length,
      //   )
      // // for listview      ? ListView.builder(
      // //       itemCount: CatalogModel.items.length,
      // //       itemBuilder: (context, index){
      // //       return ItemWidget(
      // //         item : CatalogModel.items[index],
      // //     );},)
      //       : Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
      // drawer: MyDrawer(),
    );
  }
}







