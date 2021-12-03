import 'package:eccomerce_app/login.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController nameC = TextEditingController();
TextEditingController emailC = TextEditingController();
TextEditingController housC = TextEditingController();
TextEditingController cityC = TextEditingController();
TextEditingController provinaceC = TextEditingController();
TextEditingController countryC = TextEditingController();
TextEditingController streetC = TextEditingController();

final formKey = GlobalKey<FormState>();

submit() {
  if (formKey.currentState!.validate()) {}
}

class profileInitPage extends StatelessWidget {
  static const id = '/Homepage';

  // ye niche code me logout k liye kia he
  Future signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
        () => Navigator.pushReplacementNamed(context, Loginpage.id));
  }
  // yaha tak lagout ka code he

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: appbarColor,
        actions: [
          IconButton(
            onPressed: () {
              // our yaha par call kia logout code
              signout(context);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      // body: Text(FirebaseAuth.instance.currentUser.phoneNumber),

      // ye upar body me jo code is firebase see number ko show karta he

      body: my_form_templet(),
    );
  }
}

// ye niche form banaya he

class my_form_templet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Card(
            color: Colors.grey.shade100,
            child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: nameC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              label: Text('What people call you'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: emailC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter email',
                              label: Text('What is your email'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: housC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter house no',
                              label: Text('What is your house no'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: streetC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Street no',
                              label: Text('What street no'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: countryC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter country name',
                              label: Text('Enter Country name'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: cityC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter city',
                              label: Text('enter city name'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: provinaceC,
                            validator: (v) {
                              if (v!.length < 5) {
                                return 'should be greater then 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter provinace',
                              label: Text('which provinace'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
        Positioned(
          bottom: 27,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                submit();
              },
              child: Icon(Icons.navigate_next),
              backgroundColor: Colors.black.withOpacity(0.6),
            ),
          ),
        )
      ],
    );
  }
}
