import 'package:flutter/material.dart';
class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.onpressed,
    required this.title,
  });

  final Function() onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0,),

      ),
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}