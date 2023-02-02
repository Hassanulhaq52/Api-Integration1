import 'package:flutter/material.dart';
import 'package:simple_api_integration/constants/constants.dart';

class ApiText extends StatelessWidget {
  const ApiText({
    super.key,
    required this.apiText,
  });

  final String apiText;

  @override
  Widget build(BuildContext context) {
    return Text(
      apiText,
      style: Constants.apiDataStyle,
    );
  }
}