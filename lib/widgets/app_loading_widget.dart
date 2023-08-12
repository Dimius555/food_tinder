import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_tinder/config/ui_theme.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UIThemes theme = UIThemes.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.black.withAlpha(80),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: CupertinoActivityIndicator(
            color: theme.accentApp,
            radius: 20,
          ),
        )
      ],
    );
  }
}
