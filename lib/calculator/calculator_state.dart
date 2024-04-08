part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}
class ManipulateUserDataState extends CalculatorState {
  late String name;
  late String email;
  late String phone;
  late bool isValid;

  ManipulateUserDataState({required this.name, required this.email, required this.phone, required this.isValid});
}
