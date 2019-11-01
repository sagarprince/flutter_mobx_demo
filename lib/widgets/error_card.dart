import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final bool isError;
  final String error;
  final Function onRetry;

  ErrorCard({Key key, this.isError = false, this.error = '', this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 0.0),
          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 180.0,
                    child: Image.asset('assets/images/error.png'),
                  ),
                  SizedBox(height: 40.0),
                  Text('Oops!',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10.0),
                  isError
                      ? Text('No Data Found')
                      : Text(error,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10.0),
                  IconButton(
                    icon: Icon(Icons.refresh, size: 35.0),
                    onPressed: () {
                      if (onRetry != null) {
                        onRetry();
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
