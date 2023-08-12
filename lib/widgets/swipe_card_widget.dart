import 'package:flutter/material.dart';
import 'package:food_tinder/config/ui_theme.dart';

class SwipeCardWidget extends StatelessWidget {
  const SwipeCardWidget({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.green, Colors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: theme.header24Bold.copyWith(color: theme.whiteColor),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: theme.text17Regular.copyWith(color: theme.whiteColor),
                ),
              ],
            )),
      ),
    );
  }
}
