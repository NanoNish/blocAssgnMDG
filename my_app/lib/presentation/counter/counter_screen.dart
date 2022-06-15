import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/locator.dart';
import 'package:my_app/services/local_storage_service.dart';
import '../../services/apiservice.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  //int get counter => locator<LocalStorageService>().stateValue;
  String bin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: Center(child:
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Row(children: [
            FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => {
                      print("+1"),
                      context
                          .read<CounterBloc>()
                          .add(Increment(counter: state.counter)),
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Oh Boy this increases'),
                        duration: Duration(seconds: 1),
                      )),
                    }),
            const SizedBox(
              width: 8,
            ),
            Text('${state.counter}',
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              width: 8,
            ),
            FutureBuilder<String?>(
                future: Binary().getData(state.counter.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String? data = snapshot.data;
                    if (data != null) {
                      bin = data;
                      return Text(bin);
                    }
                  }
                  return const CircularProgressIndicator();
                }),
            const SizedBox(
              width: 8,
            ),
            FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => {
                      print("-1"),
                      context
                          .read<CounterBloc>()
                          .add(Decrement(counter: state.counter)),
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Oh Boy this decreases'),
                        duration: Duration(seconds: 1),
                      )),
                    }),
          ]);
        })));
  }
}
