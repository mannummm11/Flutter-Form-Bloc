import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_form_flutter/calculator/calculator_bloc.dart';

import 'home.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late CalculatorBloc cb;
  FormDetail formDetail = FormDetail();

  @override
  void initState() {
    // TODO: implement initState
    cb = context.read<CalculatorBloc>();
    print("Its initiated {formDetail.name}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    formDetail = ModalRoute.of(context)!.settings.arguments as FormDetail;
    print("Its initiated ${formDetail.name}");
    return SafeArea(
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            switch (state) {
              case CalculatorInitial():
                {
                  Future.delayed(Duration(seconds: 5),(){
                    cb.add(ManipulateUserDataEvent(
                        formDetail.name, formDetail.emailId, formDetail.mobileNumber, formDetail.isTermsAgreed));
                  });
                  return const Scaffold(body: Center(
                    child: CircularProgressIndicator(color: Colors.orangeAccent,),
                  ));
                }
              case ManipulateUserDataState():
                {
                  return xyz(cb.state as ManipulateUserDataState);
                }
              default:
                {
                  return const Scaffold();
                }
            }
          },
      ),
    );
  }

  Widget xyz(ManipulateUserDataState state) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userDetailView("Name : ", state.name),
              userDetailView("Email : ", state.email),
              userDetailView("Mobile No : ", state.phone),
              userDetailView("Is Authenticated : ", state.isValid.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget userDetailView(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )),
          Expanded(
              flex: 1,
              child: Text(
                value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}
