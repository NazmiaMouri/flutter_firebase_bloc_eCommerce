import 'package:flutter/material.dart';

Widget listTile(BuildContext context,
    {Widget? leading,
    Widget? trailing,
    required String title,
    String? subtitle,
    double? width}) {
  return Row(
    children: [
      leading!,
      const SizedBox(width: 5),
      SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              subtitle!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
      const SizedBox(width: 5),
      trailing!
    ],
  );
}
