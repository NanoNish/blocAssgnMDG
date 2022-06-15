import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './core/locator.dart';
import './services/local_storage_service.dart';
import './services/apiservice.dart';
import './presentation/counter/counter_screen.dart';
import './presentation/counter/bloc/counter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  LocalStorage localStorage = locator<LocalStorage>();
  counterStr = LocalStorage.getCount();
  runApp(MyApp());
}

String counterStr = "0";
int counter = int.parse(LocalStorage.getCount());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterBloc(counter),
        child: CounterPage(),
      ),
    );
  }
}
