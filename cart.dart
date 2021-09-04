import 'package:pract_app/core/store.dart';
import 'package:pract_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
    late CatalogModel _catalog;

  // Collections of Ids - Stors Ids Of Each Items
  final List<int> _itemIds = [];

  //Get Catalog

  CatalogModel get catalog => _catalog;

  set catalog (CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//  Get Item In The Cart
  List<Item> get items =>   _itemIds.map((id) => _catalog.getById(id)).toList();

//  Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);


//  Add Items
  void add(Item item){
    _itemIds.add(item.id);
  }

}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);

  }

}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}