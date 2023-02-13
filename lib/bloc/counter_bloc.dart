import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);
  int initialData;
  var logger = Logger();

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    logger.d(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    logger.d(error);
  }
}
