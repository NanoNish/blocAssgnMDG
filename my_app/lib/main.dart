import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './core/locator.dart';
import './services/local_storage_service.dart';
import './presentation/counter/counter_screen.dart';
import './presentation/counter/bloc/counter_bloc.dart';

Future<void> main() async {
  await setupLocator();
  runApp(MyApp());
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
