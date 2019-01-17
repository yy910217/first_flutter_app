import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:first_flutter_app/page_counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.white,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
            builder: (context) => MainTablePage(), settings: settings);
      },
    );
  }
}

enum _Pages {
  page1,
}

String _getPageName(_Pages page) {
  switch (page) {
    case _Pages.page1:
      return '计数器';
    default:
      return '';
  }
}

class MainTablePage extends StatelessWidget {
  final _pages = [
    _Pages.page1,
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Demo'),
        backgroundColor: Colors.blue,
      ),
      child: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: _pages.length,
            itemBuilder: (context, index) => GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                    child: Text(
                      _getPageName(_pages[index]),
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  onTap: () => _routeToPage(context, _pages[index]),
                ),
          ),
        ),
      ),
    );
  }
}

void _routeToPage(BuildContext context, _Pages page) {
  switch (page) {
    case _Pages.page1:
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => CounterPage()));
      break;
  }
}
