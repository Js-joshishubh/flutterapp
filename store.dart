import 'package:pract_app/models/cart.dart';
import 'package:pract_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  // ignore: non_constant_identifier_names
   late CatalogModel catalog;
   late CartModel cart;

  MyStore(){
    catalog =CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

}