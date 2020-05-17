import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/providers/counter_state.dart';

import '../../locator.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterStateProvider>(
        create: (context) => locator<CounterStateProvider>(),
        child: Consumer<CounterStateProvider>(
            builder: (BuildContext context, CounterStateProvider model,
                    Widget child) =>
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
                          '${locator<CounterStateProvider>().counter}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => locator<CounterStateProvider>().counter++,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                )));
  }
}
