import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${S.of(context).language}: "),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        S.of(context).english,
                      ),
                      value: 'en',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        S.of(context).russian,
                      ),
                      value: 'ru_RU',
                    ),
                  ],
                  value: Intl.getCurrentLocale(),
                  onChanged: (value) async {
                    if (value == 'ru_RU') {
                      await S.load(
                        const Locale('ru', 'RU'),
                      );
                      setState(() {});
                    } else if (value == 'en') {
                      await S.load(
                        const Locale('en'),
                      );
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            const Spacer(),
            Text('${S.of(context).counterValue}: '),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                  flex: 1,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
