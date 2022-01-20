import 'new_items.dart';

class Store {
  List<NewItems>? newItems;

  Store({this.newItems});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['newItems'] != null) {
      newItems = <NewItems>[];

      json['newItems'].forEach((value) {
        newItems!.add(NewItems.fromJson(value));
      });
    }
  }
}
