// ignore_for_file: no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';

class UpdateCounter extends StatefulWidget {
  final int count;

  const UpdateCounter({super.key, required this.count});

  // 1
  @override
  State<UpdateCounter> createState() {
    print("LIFECYCLE APP TESTING createState");
    return _UpdateCounterState();
  }
}

class _UpdateCounterState extends State<UpdateCounter> {
  /*
  Stateful Widget Lifecycle
Why Are StatefulWidget and State Separate Classes?
  - The main reason is performance. States are long lived and the
  stateful widget just rebuilds when configurations changes.
1. createState()
  - The first method that starts to create a StatefulWidget.
2. mounted is true
  - A buildContext is assigned to that state when the state creates.
  This flag just checks when the buildContext is assigned. If it's so -
  it returns true. To change the state using setState,
  it needs to make sure that the state exists. It's useful to use when you
  don't know how often and when the setState calls.
3. initState()
  - The first method in State class is called once and only once. The best
  time to use it for: initializing data and subscribing some streams.
4. didChangeDependencies()
  - It calls immediately after initState and before build once
  and after the case: when an object depends on data from
  (example using: InheritedWidget). In the first change you have to call
  BuildContext.inheritFromWidgetOfExactType to make thisState 'listen' to
  changes on a widget it's inherited data from. Useful when you need to do
  network call or any expensive action when an InheritedWidget updates.
5. build()
  - It returns a Widget (UI). It can rebuilds after setState calling.
6. didUpdateWidget(Widget oldWidget)
  - It's called when the parent widget changes and has to rebuild this widget
  (when the data changes). It has an old Widget param to compare the last
  widget with a new widget.
7. setState()
  - It forces for data changing and rebuilding the app's UI. It notifies the
  framework when it needs to recall build when data has changed. setState
  cannot be async, so it can be called as often as required.
8. deactivate()
  - It calls when the State is removed from the tree, but it still might
  be reinserted in this tree.
9. dispose()
  - It calls when the State is removed PERMANENTLY. So it's good for
  disposing and unsubscribing using data.
10. mounted is false
  - The mounted is false, when the State object can never remount,
  and an error is thrown is setState() is called.

  The order of calling:
  1) createState
  2) initState
  3) didChangeDependencies
  4) build

  When the user calls setState():
  1) setState
  2) build (or: didUpdateWidget -> build)

  When the app is closing:
  1) deactivate
  2) dispose

  Extra lifecycle method: didChangeAppLifecycleState.
  It calls when the system puts the app in the background
  or returns the app to the foreground.
   */

  int _counter = 0;

  // 2 - true, 10 - false
  @override
  bool get mounted {
    print("LIFECYCLE APP TESTING mounted = ${super.mounted}");
    return super.mounted;
  }

  // 3
  @override
  void initState() {
    _counter = widget.count;

    print("LIFECYCLE APP TESTING initState");
    super.initState();
  }

  // 4
  @override
  void didChangeDependencies() {
    print("LIFECYCLE APP TESTING didChangeDependencies");
    super.didChangeDependencies();
  }

  // 5
  @override
  Widget build(BuildContext context) {
    print("LIFECYCLE APP TESTING build $_counter");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(context, "Cancel"),
                const SizedBox(width: 10),
                _button(context, "Update", _counter),
              ],
            ),
            const SizedBox(height: 10),
            if (widget.count > 0) _button(context, "Clear", 0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _button(BuildContext context, String title, [int? value]) {
    return SizedBox(
      height: 50,
      width: 125,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context, value),
        child: Text(title),
      ),
    );
  }

  // 6
  @override
  void didUpdateWidget(covariant UpdateCounter oldWidget) {
    print("LIFECYCLE APP TESTING didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  void _incrementCounter() {
    // 7
    setState(() {
      print("LIFECYCLE APP TESTING setState $_counter");
      _counter += 10;
    });
  }

  // 8
  @override
  void deactivate() {
    print("LIFECYCLE APP TESTING deactivate");
    super.deactivate();
  }

  // 9
  @override
  void dispose() {
    print("LIFECYCLE APP TESTING dispose");
    super.dispose();
  }
}
