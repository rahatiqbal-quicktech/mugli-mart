import 'package:hive/hive.dart';
part 'HiveModel.g.dart';

@HiveType(typeId: 0)
class WishList {
  @HiveField(0)
  String name;

  @HiveField(1)
  String id;

  @HiveField(2)
  String price;

  @HiveField(3)
  String image;

  WishList(
      {required this.name,
      required this.id,
      required this.price,
      required this.image});
}
