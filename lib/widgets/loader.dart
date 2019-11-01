import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';

class Loader extends StatelessWidget {
  Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Center(
            child: CircularProgressIndicator(backgroundColor: AppColors.primary),
          ),
        )
      ],
    );
  }
}
