import 'package:flutter/widgets.dart';

class Space extends StatelessWidget {
  final double size = 8;

  Space({Key key, double size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(size));
  }
}
