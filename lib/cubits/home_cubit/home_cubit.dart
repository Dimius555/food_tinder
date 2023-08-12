import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tinder/data/models/dish.dart';
import 'package:food_tinder/repositories/repositories_interfaces.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // Статические методы для прослушивания и получения кубита
  static HomeState watchState(BuildContext context) => context.watch<HomeCubit>().state;
  static HomeCubit read(BuildContext context) => context.read<HomeCubit>();

  HomeCubit({required DishesRepository dishesRepository})
      : _dishesRepository = dishesRepository,
        super(HomeState(dishes: [], status: HomeInitialStatus()));

  final DishesRepository _dishesRepository;

  void fetchDishes({bool isReloading = false}) async {
    // В параметр dishes засунул тернарный оператор для симуляции,
    // что будто делаем новую подгрузку данных
    emit(state.copyWith(status: HomeIsLoading(), dishes: isReloading ? [] : null));
    try {
      final list = await _dishesRepository.fetchDishes();
      // Если все прошло успешно, то возвращаем соответствующий статус и наши dishes
      // Делаю shuffle для перемешки, чтоб каждый раз порядок фрутков и овощей был разный
      emit(state.copyWith(status: HomeSuccessfulStatus(), dishes: list..shuffle()));
    } catch (e) {
      // Возвращаем статус с ошибкой
      // в данном случае текст ошибки хардкодный, так как мы симулируем ситуацию
      const String message = "Что-то пошло не так";
      emit(state.copyWith(status: HomeErrorAppeared(errorMessage: message)));
    } finally {
      // Блок finally используем для того, чтоб если произошла ошибка,
      // то после 5 секунд можно было бы вернуть состояние, которое было до загрузки
      // при этом параметр dishes остантся таким, какой и был
      if (state.status is HomeErrorAppeared) {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(status: HomeSuccessfulStatus()));
      }
    }
  }

  void reachedLastElement() async {
    // Этот метод я сделал спецально, чтоб показать как работает пустое состояние
    // он симулирует ситуацию, когда, дашел до последнего жлемента, а новых больше нет
    emit(state.copyWith(status: HomeIsLoading()));
    // Делаем симуляцию задержки из-за запроса на 3 секунды
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: HomeSuccessfulStatus(), dishes: []));
  }
}
