import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tinder/pages/main_app/main_app.dart';

class CubitsSetup extends StatelessWidget {
  const CubitsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      // После инициализации глобальных кубитов запускаем инициализацию приложения
      child: MainApp(),
    );
  }
}
