import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorEvent>((event, emit) {
      switch(event) {
      case ManipulateUserDataEvent(): {
          emit(
              ManipulateUserDataState(
              name: event.name.toUpperCase(), email: event.email.toUpperCase(), phone: event.phone.replaceAll("9", "*"),isValid: event.isValid
            )
          );
      }
      default:{

      }
      }
    });
  }
}
