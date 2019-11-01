import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/styles.dart';

class TopTabsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Today',
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700)),
          color: AppColors.blueLight,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          padding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('Tomorrow',
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700)),
          padding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('Next Week',
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700)),
          padding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          onPressed: () {},
        )
      ],
    );
  }
}
