import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class mainCubit extends Cubit<mainState> {
  mainCubit() : super(mainInitial());

  static mainCubit get(context) => BlocProvider.of(context);

  void navigateToCheckOut() {
    emit(CheckOutScreenState());
  }

  void navigateToBag() {
    emit(ShoppingPagScreenState());
  }

  void navigateToPayment() {
    emit(ShoppingPaymentScreenState());
  }

  void navigateBack() {
    emit(BackState());
  }
}
