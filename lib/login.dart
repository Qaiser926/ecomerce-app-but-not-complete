import 'package:eccomerce_app/model/authProvider.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController inputControler =
      TextEditingController(); // is ka mtlb ye k jitne b form ki functionality he us ko ak key control kare gi our us key ko hum value assign kare gi (formkey) k name see
  static const id = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'photo/logopic.png',
                height: 150,
              ),
            ),
            SizedBox(
              height: 160,
            ),
            Text(
              'Shopiz',
              style: text_style,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: inputControler,
                          decoration: InputDecoration(
                              hintText: 'Enter your number',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      onPressed: () {
                        // ye if statment me jo kam kia he o login with phone k liye kia he .
                        if (inputControler.text != null) {
                          final Phone = '+92' + inputControler.text;
                          AuthProvider().loginwithPhone(context, Phone);
                        }
                        // yaha tak jo upar code he ye login with phone k liye he
                      },
                      minWidth: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                      color: appbarColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
