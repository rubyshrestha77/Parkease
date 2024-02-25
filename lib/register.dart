import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  TextEditingController _addressController = TextEditingController();
  // TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //A bool variable for show and hide password
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
        // padding: const EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //   image: AssetImage('assets/login.png'),fit: BoxFit.cover)
        // )
        body: Stack(children: [
          // Container(
          //   padding: const EdgeInsets.only(left: 80, top: 10, right: 80),
          //   //padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //   child: Text(
          //     'Create a new Account',
          //     style: TextStyle(color: Colors.black, fontSize: 20),
          //     textDirection: TextDirection.ltr,
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Container(
            margin:
                const EdgeInsets.only(top: 60, left: 10, bottom: 30, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email address';
                        }
                        // else if (!RegExp(
                        //         r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid email address';
                        // }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !isVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(.05),
                        filled: true,
                        icon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.all(5),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                  //   ),
                  //   child: TextFormField(
                  //     controller: _addressController,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter address';
                  //       } else
                  //         return null;
                  //     },
                  //     decoration: const InputDecoration(
                  //       icon: Icon(Icons.home),
                  //       hintText: 'Address',
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.all(5),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     color: Color.fromARGB(255, 98, 190, 236).withOpacity(.3),
                  //   ),
                  //   child: TextFormField(
                  //     controller: _numberController,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter your phone number';
                  //       } else
                  //         return null;
                  //     },
                  //     decoration: const InputDecoration(
                  //       icon: Icon(Icons.phone),
                  //       hintText: 'Contact Number',
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 98, 190, 236),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushNamed(context, 'home_page');

                          // ignore: unused_local_variable
                          UserCredential? usercredential;
                          try {
                            usercredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text.toString(),
                                    password:
                                        _passwordController.text.toString())
                                // ignore: body_might_complete_normally_nullable
                                .then((value) {
                              Navigator.pushNamed(context, 'home_page');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyHomePage(title: "HomePage")));
                            });
                          } on FirebaseAuthException catch (ex) {
                            // (context, ex.code.toString());

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(ex.code.toString()),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Okay"))
                                  ],
                                );
                              },
                            );
                          }

                          // Navigator.pushNamed(context, 'home_page');
                          // Login method will be here
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Invalid Credentials'),
                                content: Text(
                                    'Please check your username, email and password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 98, 190, 236),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
