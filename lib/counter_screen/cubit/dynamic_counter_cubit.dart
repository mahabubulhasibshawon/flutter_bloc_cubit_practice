
import 'package:flutter_bloc/flutter_bloc.dart';

class DynamicCounterCubit extends Cubit<Map<String, int>> {
  DynamicCounterCubit() : super({});

  void increment (String counterId) {
    final currentState = Map<String, int>.from(state);
    currentState[counterId] = (currentState[counterId] ?? 0) +1;
    emit(currentState);
  }

  void decrement (String counterId) {
    final currentstate = Map<String, int>.from(state);
    if(currentstate[counterId] != null && currentstate[counterId]! > 0) {
      currentstate[counterId] = currentstate[counterId]! - 1 ;
      emit(currentstate);
    }
  }

  void reset (String counterId) {
    final currentstate = Map<String, int>.from(state);
    currentstate[counterId] = 0;
    emit(currentstate);
  }

  void addCounter(String counterId) {
    final currentstate = Map<String, int>.from(state);
    currentstate[counterId] = 0;
    emit(currentstate);
  }
}