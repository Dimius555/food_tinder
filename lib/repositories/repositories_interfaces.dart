import 'package:food_tinder/data/models/dish.dart';

abstract class DishesRepository {
  Future<List<Dish>> fetchDishes();
}
