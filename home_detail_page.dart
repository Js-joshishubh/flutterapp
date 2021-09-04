import 'package:flutter/material.dart';
import 'package:pract_app/models/catalog.dart';
import 'package:pract_app/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH8,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              AddToCart(catalog: catalog,).wh(120, 50),
            ],
          ).p12(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent),
        backgroundColor: context.canvasColor,
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                color: context.cardColor,
                  width: context.screenWidth,
                  child:  Column(
                    children: [
                      catalog.name.text.bold.xl4.color(context.accentColor).make(),
                      catalog.desc.text.blue400.xl.make(),
                      10.heightBox,
                      "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                          .text.make().p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

