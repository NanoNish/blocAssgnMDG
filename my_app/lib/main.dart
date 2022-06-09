import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: Center(
            child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Column(children: [
            Text('$count', style: Theme.of(context).textTheme.headline1),
            FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => {
                      print("+1"),
                      context.read<CounterBloc>().add(Increment()),
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Oh Boy this increases'),
                        duration: Duration(seconds: 1),
                      )),
                    }),
            FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => {
                      print("-1"),
                      context.read<CounterBloc>().add(Decrement()),
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Oh Boy this decreases'),
                        duration: Duration(seconds: 1),
                      )),
                    }),
          ]);
        })));
  }
}
