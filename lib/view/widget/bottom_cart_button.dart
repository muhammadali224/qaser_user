import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomNavigatButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color color;
  final Color? iconColor;
  final Color? textColor;
  final IconData icon;

  const ButtomNavigatButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
    required this.icon,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: textColor),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}
