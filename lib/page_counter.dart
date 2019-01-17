import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<CounterPage> {
  int count = 0;

  void _incrementCounter() => setState(() => ++count);
  void _decrementCounter() {
    if (count == 0) return;
    setState(() => --count);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: new Text('计数器'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$count',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              CupertinoButton(
                child: Text('+'),
                onPressed: _incrementCounter,
              ),
              CupertinoButton(
                child: Text('-'),
                onPressed: _decrementCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
