import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/user.dart';
import 'package:vegiwell/Pages/Home%20Page/homepage.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({Key? key}) : super(key: key);

  final PhoneAuthController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    // text field controllers
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController userSurnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController numberController = TextEditingController();

    numberController.text = PhoneAuthController.usernumber.substring(3);

    // text form fields
    final userNameField = TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      controller: userNameController,
      // validator: (){},
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: AppTheme.numberfield,
        // fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(
          responsiveWidth(20),
          responsiveHeight(15),
          responsiveWidth(20),
          responsiveHeight(15),
        ),
        hintText: "Enter your Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(responsiveWidth(30)),
        ),
      ),
    );

    final userSurnameField = TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      controller: userSurnameController,
      // validator: (){},
      onSaved: (value) {
        userSurnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: AppTheme.numberfield,
        // fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(
          responsiveWidth(20),
          responsiveHeight(15),
          responsiveWidth(20),
          responsiveHeight(15),
        ),
        hintText: "Enter your Surname",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(responsiveWidth(30)),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      // validator: (){},
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: AppTheme.numberfield,
        // fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: const Icon(
          Icons.mail,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(
          responsiveWidth(20),
          responsiveHeight(15),
          responsiveWidth(20),
          responsiveHeight(15),
        ),
        hintText: "Enter your Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(responsiveWidth(30)),
        ),
      ),
    );

    final addressField = TextFormField(
      autofocus: true,
      keyboardType: TextInputType.streetAddress,
      controller: addressController,
      // validator: (){},
      onSaved: (value) {
        addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: AppTheme.numberfield,
        // fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: const Icon(
          Icons.location_city,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(
          responsiveWidth(20),
          responsiveHeight(15),
          responsiveWidth(20),
          responsiveHeight(15),
        ),
        hintText: "Enter your Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(responsiveWidth(30)),
        ),
      ),
    );

    final numberField = TextFormField(
      autofocus: false,
      readOnly: true,
      keyboardType: TextInputType.number,
      controller: numberController,
      // validator: (){},
      onSaved: (value) {
        numberController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: AppTheme.numberfield,
        // fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: const Icon(
          Icons.location_city,
          color: Colors.orange,
        ),
        contentPadding: EdgeInsets.fromLTRB(
          responsiveWidth(20),
          responsiveHeight(15),
          responsiveWidth(20),
          responsiveHeight(15),
        ),
        hintText: "Enter your Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(responsiveWidth(30)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Profile Details",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: responsiveHeight(25),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveHeight(15), vertical: responsiveWidth(50)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              userNameField,
              SizedBox(
                height: responsiveHeight(20),
              ),
              userSurnameField,
              SizedBox(
                height: responsiveHeight(20),
              ),
              emailField,
              SizedBox(
                height: responsiveHeight(20),
              ),
              addressField,
              SizedBox(
                height: responsiveHeight(20),
              ),
              numberField,
              SizedBox(
                height: responsiveHeight(30),
              ),
              InkWell(
                onTap: () {
                  UserInformation userdata = UserInformation(
                    name: userNameController.text,
                    userlastname: userSurnameController.text,
                    email: emailController.text,
                    address: addressController.text,
                    number: numberController.text,
                    cart: [],
                  );
                  loginController.createUser(userdata, const MainHomePage());
                },
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        AppTheme.green,
                        AppTheme.lightGreen,
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: responsiveWidth(320),
                    height: responsiveHeight(50),
                    alignment: Alignment.center,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
