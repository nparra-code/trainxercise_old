/*import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder(
      {super.key,
      required this.itemBuilder,
      required this.mainAxisAlignment,
      required this.mainAxisSize,
      required this.crossAxisAlignment,
      required this.textDirection,
      required this.verticalDirection,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          itemCount, (index) => itemBuilder(context, index).toList()),
    );
  }
}
*/