import 'package:flutter/material.dart';
import 'package:skeleton/viewmodels/main_model.dart';

import 'base_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainModel>(
        onModelReady: (model) {},
        builder: (BuildContext context, MainModel model, Widget child) =>
            Scaffold(
              appBar: AppBar(
                title: Text("Testing Provider"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${model.counter}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => model.counter++,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ));
  }
}
