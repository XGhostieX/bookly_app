import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMsg;
  const CustomErrorWidget({Key? key, required this.errMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMsg,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
