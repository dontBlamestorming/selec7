import 'new_items.dart';
import 'recent_sold_items.dart';
import 'popular_items.dart';

class Store {
  List<NewItems>? newItems;
  List<RecentSoldItems>? recentSoldItems;
  List<PopularItems>? popularItems;

  Store({this.newItems, this.recentSoldItems, this.popularItems});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['newItems'] != null) {
      newItems = <NewItems>[];

      json['newItems'].forEach((value) {
        newItems!.add(NewItems.fromJson(value));
      });
    }

    if (json['recentSoldItems'] != null) {
      recentSoldItems = <RecentSoldItems>[];

      json['recentSoldItems'].forEach((value) {
        recentSoldItems!.add(RecentSoldItems.fromJson(value));
      });
    }

    if (json['popularItems'] != null) {
      popularItems = <PopularItems>[];

      json['popularItems'].forEach((value) {
        popularItems!.add(PopularItems.fromJson(value));
      });
    }
  }
}
