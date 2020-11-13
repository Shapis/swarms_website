import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

class BaseScreen extends StatelessWidget {
  final List<Widget> child;

  const BaseScreen({Key key, @required this.child}) : super(key: key);

  List<Widget> getList() {
    List<Widget> startOfList = [MenuBar()];
    List<Widget> endOfList = [Footer()];

    return (child != null)
        ? startOfList + child + endOfList
        : startOfList + endOfList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: ListView.builder(
              itemCount: getList().length,
              itemBuilder: (context, index) {
                return getList()[index];
              },
            ),
          ),
        ));
  }
}
