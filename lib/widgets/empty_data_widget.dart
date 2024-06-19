import 'package:flutter/material.dart';

import '../helpers/app_constant.dart';

class AsyncLoaderHelperWidget {
  static Widget emptyView(
      {required String text, required VoidCallback onPress, String? image}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'assets/images/refresh.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 15, right: 15),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
                onPressed: onPress,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    side: const BorderSide(color: MyColor.colorBlue)),
                child: const Text(
                  'Refresh',
                  style: TextStyle(color: MyColor.colorBlue),
                )),
          )
        ],
      ),
    );
  }
}
