import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:food_tinder/config/ui_theme.dart';
import 'package:food_tinder/cubits/home_cubit/home_cubit.dart';
import 'package:food_tinder/widgets/app_loading_widget.dart';
import 'package:food_tinder/widgets/swipe_card_widget.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _counter;
  late SwipeableCardSectionController _cardController;

  @override
  void initState() {
    _cardController = SwipeableCardSectionController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: Platform.isAndroid || Platform.isIOS
          ? AppBar(
              title: Text(
                'Любимые фруткы и овощи',
                style: theme.appBarTextStyle.copyWith(color: theme.whiteColor),
              ),
            )
          : null,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status is HomeSuccessfulStatus) {
            _counter = 0;
          }
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              if (state.dishes.isEmpty && state.status is! HomeIsLoading)
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Нет данных для показа',
                        style: theme.header24Semibold,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                          onPressed: () {
                            HomeCubit.read(context).fetchDishes(isReloading: true);
                          },
                          child: Text(
                            'Обновить',
                            style: theme.button16Semibold.copyWith(color: theme.accentApp),
                          ))
                    ],
                  ),
                ),
              if (state.dishes.isNotEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwipeableCardsSection(
                      cardController: _cardController,
                      context: context,
                      items: _createFirstThreeCards(state),
                      onCardSwiped: (dir, index, widget) {
                        // Добавляем новую карточку
                        if (state.dishes.length >= 3 && _counter < state.dishes.length) {
                          _cardController.addItem(SwipeCardWidget(
                            description: state.dishes[_counter].descriptions,
                            title: state.dishes[_counter].name,
                          ));
                        }

                        if (_counter == state.dishes.length) {
                          HomeCubit.read(context).reachedLastElement();
                        }
                        log(_counter.toString());
                        _counter++;
                      },
                      enableSwipeUp: false,
                      enableSwipeDown: false,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            child: const Icon(Icons.chevron_left),
                            onPressed: () {
                              _cardController.triggerSwipeLeft();
                            },
                          ),
                          FloatingActionButton(
                            child: const Icon(Icons.chevron_right),
                            onPressed: () {
                              _cardController.triggerSwipeRight();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              if (state.status is HomeIsLoading) const AppLoadingWidget()
            ],
          );
        },
      ),
    );
  }

  List<Widget> _createFirstThreeCards(HomeState state) {
    int c = 0;
    List<Widget> result = [];
    if (state.dishes.length > 3) {
      while (c < 3) {
        result.add(
          SwipeCardWidget(
            description: state.dishes[c].descriptions,
            title: state.dishes[c].name,
          ),
        );
        c++;
      }
    } else {
      for (final e in state.dishes) {
        result.add(
          SwipeCardWidget(
            description: e.descriptions,
            title: e.name,
          ),
        );
      }
    }

    return result;
  }
}
