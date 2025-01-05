import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

//   method to increase the counter
  void increment() => emit(state + 1);

  // method to drecrease the counter
  void decremnt() => emit(state - 1);
}
