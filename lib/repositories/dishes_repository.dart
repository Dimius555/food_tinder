import 'package:food_tinder/data/api/dishes_api.dart';
import 'package:food_tinder/data/models/dish.dart';
import 'package:food_tinder/repositories/repositories_interfaces.dart';

class DishesRepositoryImpl extends DishesRepository {
  final DishesAPI api;

  DishesRepositoryImpl({required this.api});

  @override
  Future<List<Dish>> fetchDishes() async {
    try {
      return await api.fetchDishes();
    } catch (e) {
      rethrow;
    }
  }
}
