import 'package:bloc/bloc.dart';

import '../../../services/local_storage_service.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter)
      : super(CounterState(counter: int.parse(LocalStorage.getCount()))) {
    on<Increment>((event, emit) => {
          LocalStorage.setCount(
              (int.parse(LocalStorage.getCount()) + 1).toString()),
          emit(CounterState(counter: state.counter + 1))
        });

    on<Decrement>((event, emit) => {
          LocalStorage.setCount(
              (int.parse(LocalStorage.getCount()) - 1).toString()),
          emit(CounterState(counter: state.counter - 1))
        });
  }
}
