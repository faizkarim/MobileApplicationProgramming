import './rest_service.dart';
import '../modal/itemModal.dart';

class ItemService {
  static final ItemService _instance = ItemService._constructor();
  factory ItemService() {
    return _instance;
  }

  ItemService._constructor();
  final rest = RestService();

  Future<List<Item>> getAllItem() async {
    final listJson = await rest.get('items');

    return (listJson as List)
        .map((itemJson) => Item.fromJson(itemJson))
        .toList();
  }

  Future<List<Item>> getAllSaveItem() async {
    final listJson = await rest.get('items');

    return (listJson as List)
        .map((itemJson) => Item.fromJson(itemJson))
        .where((element) => element.save == true)
        .toList();
  }

  Future<Item> addItem({Item n}) async {
    final json = await rest.post('items', data: n.toJson());
    return Item.fromJson(json);
  }

  Future<Item> updateItem({String id, bool save}) async {
    final json = await rest.patch('items/$id', data: {'save': !save});
    return Item.fromJson(json);
  }

  Future<Item> deleteItem({String id}) async {
    final json = await rest.delete('items/$id');
    return Item.fromJson(json);
  }
}
