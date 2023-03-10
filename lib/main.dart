import 'package:bloc_applcation_flutter/Features/Presenatation/Counter/bloc/counter_cubit.dart';
import 'package:bloc_applcation_flutter/Features/Presenatation/Counter/bloc/getRandomNames_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterCubit _counterState;
  late GetRandomNamesCubit _getRamdonName;
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _counterState = CounterCubit();
    _getRamdonName = GetRandomNamesCubit();
  }

  @override
  void dispose() {
    _getRamdonName.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String?>(
                stream: _getRamdonName.stream,
                builder: (context, snapshot) {
                  final button = ElevatedButton(
                      onPressed: () => _getRamdonName.pickname(),
                      child: const Text("Get Random Names"));
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    return button;
                    case ConnectionState.waiting:
                    return button;
                    case ConnectionState.active:
                    return Column(
                      children: [
                        Text(snapshot.data??""),button

                      ],
                    );
                    case ConnectionState.done:
                      return const SizedBox();
                  }
                }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              bloc: _counterState,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterState.increment();
            },
            tooltip: 'minus',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterState.decreament();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
