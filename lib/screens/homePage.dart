
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../utils/variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _height=MediaQuery.of(context).size.height;
    double _width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Register here"),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: Variable.register,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: _height / 1.8,
                  width:_width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "User Name",
                          style: TextStyle(
                              color: Color(0xff777777), fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffF0F3F9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: Variable.userName,
                              validator: (val) {
                                if (val!.isEmpty ) {
                                  return 'Please enter this details';
                                }
                                if(!RegExp("^[a-zA-Z0-9+_.]+@[a-zA-Z0-9+_.]+.[a-z]").hasMatch(val))
                                  {
                                    return 'Invalid format';
                                  }
                                // if(Variable.isValid==false)
                                //   {return 'Invalid value';}
                                return null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  Variable.user_name = val;
                                  Variable.isValid = EmailValidator.validate(Variable.user_name);
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              color: Color(0xff777777), fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffF0F3F9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              obscureText: false,
                              controller: Variable.password,
                              validator:  Validators.compose([
                                Validators.required('Password is required'),
                                Validators.minLength(8, 'Must contain max 8 character'),
                                Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', 'Invalid Password')
                              ]),
                              onChanged: (val) {
                                setState(() {
                                  Variable.pswd = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                        ),

                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                              color: Color(0xff777777), fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffF0F3F9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              obscureText: false,
                              controller: Variable.confirmPassword,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter this details';
                                }
                                if(Variable.cnfrmPswd!= Variable.pswd){
                                  return"Password doesn't match";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  Variable.cnfrmPswd = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff777777),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: _height / 16,
                          width: _width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.black,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (Variable.register.currentState!
                                    .validate()) {

                                  Variable.register.currentState!.save();

                                  Navigator.of(context)
                                      .pushReplacementNamed("profile");
                                }
                              });
                            },
                            child: const Text("REGISTER"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}





