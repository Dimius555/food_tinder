import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_tinder/data/models/dish.dart';

class DishesAPI {
  Future<List<Dish>> fetchDishes() async {
    // Симулируем задержку в 1 секунду
    // как-будто это время уходит на запрос
    await Future.delayed(const Duration(seconds: 1));
    final jsonString = await rootBundle.loadString('assets/data/food.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Dish> decodedList = jsonList.map((e) => Dish.fromJson(e)).toList();
    return decodedList;
  }
}
