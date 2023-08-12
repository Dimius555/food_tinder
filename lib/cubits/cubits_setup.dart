import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tinder/cubits/home_cubit/home_cubit.dart';
import 'package:food_tinder/pages/main_app/main_app.dart';
import 'package:food_tinder/services/service_locator.dart';

class CubitsSetup extends StatelessWidget {
  const CubitsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(dishesRepository: sl())..fetchDishes(),
        ),
      ],
      // После инициализации глобальных кубитов запускаем инициализацию приложения
      child: const MainApp(),
    );
  }
}
