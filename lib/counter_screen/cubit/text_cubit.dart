import 'package:bloc/bloc.dart';

class TextCubit extends Cubit<String> {
  TextCubit() : super(' world');

  void toggleText() {
    if(state == ' world') {
      emit(' hasib');
    } else {
      emit(' world');
    }
  }
}