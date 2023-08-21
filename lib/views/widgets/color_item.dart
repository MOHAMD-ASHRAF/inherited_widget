import 'package:flutter/material.dart';
import 'package:inherited_widget/controllers/state_widget.dart';

class ColorItem extends StatelessWidget {
  final MaterialColor color;

  const ColorItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = StateInheritedWidget.of(context);
    return InkWell(
      onTap: () {
        state.setColor(color);
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
    );
  }
}