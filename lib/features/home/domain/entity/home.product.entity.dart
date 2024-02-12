import '../../data/model/home.product.response.model.dart';

class HomeProductEntity {
  HomeProductEntity(
      {required this.name,
      required this.id,
      required this.description,
      required this.price,
      required this.photo});

  factory HomeProductEntity.fromModel(HomeProductResponseModel model) =>
      HomeProductEntity(
          id: model.id,
          name: model.name,
          description: model.description,
          photo: model.photo,
          price: model.price);

  final int id;
  final String name;
  final String description;
  final double price;
  final String photo;
}
