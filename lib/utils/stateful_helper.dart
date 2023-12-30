import 'package:flutter/material.dart';

class StatefulHelper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulHelper({
    super.key,
    required this.onInit,
    required this.child,
  });

  @override
  State<StatefulHelper> createState() => _StatefulHelperState();
}

class _StatefulHelperState extends State<StatefulHelper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
