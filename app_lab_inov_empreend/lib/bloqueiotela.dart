import 'package:flutter_bloc/flutter_bloc.dart';

class bloqueiotela extends Cubit<int> {
  bloqueiotela() : super(0);

  void goToScreen(int index) => emit(index);
}
