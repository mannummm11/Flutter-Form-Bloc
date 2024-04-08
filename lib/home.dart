import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:global_form_flutter/calculator.dart';

class FormDetail {
  String name = "";
  String emailId = "";
  String mobileNumber = "";
  bool isTermsAgreed = false;

  FormDetail({this.name = "", this.emailId = "", this.mobileNumber = "", this.isTermsAgreed = false});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var isTermsAgreed = false;
  final formDetail = FormDetail();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Must be more then 5 character";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        label: const Text('Enter your name here'),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(!EmailValidator.validate(value!)) {
                          return "Please check your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text("E-Mail Id"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.grey
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _mobile,
                      validator: (value){
                        if(value!.length  < 10) return "Please correct mobile number.";
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text("Mobile Number"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: isTermsAgreed, onChanged: (isChecked){
                          setState(() {
                            isTermsAgreed = isChecked!;
                          });
                        }),
                        const Text("Terms & Conditions")
                      ],
                    ),
                    ElevatedButton(onPressed: (){
                      var form = key.currentState as FormState;
                      if(form.validate() && isTermsAgreed) {
                        //form.save();
                        final userData = FormDetail(
                            name: _nameController.text,
                            emailId: _email.text,
                            mobileNumber: _mobile.text,
                            isTermsAgreed: isTermsAgreed
                        );
                        String data = "${userData.name} ${userData.emailId} ${userData.mobileNumber} ${userData.isTermsAgreed}";
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(data)));
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Calculator(),
                          settings: RouteSettings(
                            arguments: userData
                          )
                        ));
                      } else {

                      }
                    }, child: const Text("               Submit               ")),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
