part of 'home_cubit.dart';

class HomeState {
  final List<Dish> dishes;
  final HomeStateStatus status;

  HomeState({required this.dishes, required this.status});

  HomeState copyWith({List<Dish>? dishes, HomeStateStatus? status}) {
    return HomeState(
      dishes: dishes ?? this.dishes,
      status: status ?? this.status,
    );
  }
}

interface class HomeStateStatus {}

class HomeInitialStatus extends HomeStateStatus {}

class HomeIsLoading extends HomeStateStatus {}

class HomeErrorAppeared extends HomeStateStatus {
  final String errorMessage;

  HomeErrorAppeared({required this.errorMessage});
}

class HomeSuccessfulStatus extends HomeStateStatus {}
