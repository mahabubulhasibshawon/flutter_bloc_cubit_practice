

import 'package:flutter_bloc/flutter_bloc.dart';

class MultiCheckboxCubit extends Cubit<Map<String, bool>> {
  MultiCheckboxCubit() : super ({
    'Checkbox 1' : false,
    'Checkbox 2' : false,
    'Checkbox 3' : false,
  });

  void toggleCheckbox(String label) {
    final currentState = Map<String, bool>.from(state);
    currentState[label]  = !currentState[label]!;
    emit(currentState);
  }
}