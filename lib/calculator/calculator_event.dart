part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}
class ManipulateUserDataEvent extends CalculatorEvent {
  String name = "";
  late String email;
  late String phone;
  late bool isValid;

  ManipulateUserDataEvent(this.name, this.email, this.phone, this.isValid);
}
