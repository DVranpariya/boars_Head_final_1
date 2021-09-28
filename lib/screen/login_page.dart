import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/reqestModel/login_reqestmodel.dart';
import 'package:flutter_app/model/responseModel/creat_gest_user_responseModel.dart';
import 'package:flutter_app/screen/order_history.dart';
import 'package:flutter_app/utils/responsive.dart';
import 'package:flutter_app/viewModel/login_view_model.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalObjectKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginViewModel _createGuestViewModel = Get.find();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    LoginReqModel _user = LoginReqModel();
    _user.username = 'sundar.sivaraman@boarshead.com';
    _user.password = 'Lifeversion5.0';
    _createGuestViewModel.loginViewModel(modell: _user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    bool _isObscure = true;

    return Scaffold(
      body: GetBuilder<LoginViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            LoginResponse _sdsrr = controller.apiResponse.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (Responsive.isDesktop(context))
                    Form(
                      autovalidate: true,
                      child: Row(
                        children: [
                          page(),
                          login(_isObscure),
                        ],
                      ),
                    ),
                  if (Responsive.isMobile(context))
                    Column(
                      children: [
                        page(),
                        login(_isObscure),
                      ],
                    )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Container login(bool _isObscure) {
    bool isChecked = false;
    return Container(
      height: Get.height,
      width: Responsive.isMobile(context) ? Get.width : Get.width / 2,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(child: Image.asset("assets/images/login-logo-two.png")),
              SizedBox(
                height: 30,
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: Responsive.isMobile(context)
                      ? Get.width * .035
                      : Get.width * .02,
                  color: Color(0xffAB965D),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Username or email address *',
                style: TextStyle(
                    color: Color(0xffAB965D),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: Responsive.isMobile(context)
                        ? Get.width * .025
                        : Get.width * .011),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF0F2F5),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    // validator: EmailValidator(errorText: "not validation "),
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // prefixIcon: Icon(
                        //   Icons.mobile_friendly,
                        //   color: Colors.purple,
                        // ),
                        // hintText: "Enter Mobile Number",
                        hintStyle: TextStyle(
                          color: Color(0xffAB965D),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Password *',
                style: TextStyle(
                    color: Color(0xffAB965D),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: Responsive.isMobile(context)
                        ? Get.width * .025
                        : Get.width * .011),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF0F2F5),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: StatefulBuilder(
                          builder: (context, setState) {
                            return IconButton(
                                color: Color(0xffAB965D),
                                iconSize: 15,
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                // color: Color(0xffF0F2F5),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                });
                          },
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAB965D),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        // if (_emailController.text == 'boarshead' &&
                        //     _passwordController.text == 'admin123') {
                        //   print('-----------successFul login');
                        //   Get.offAll(CartScreen());
                        // }
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          LoginReqModel _user = LoginReqModel();
                          _user.username = _emailController.text;
                          _user.password = _passwordController.text;
                          await _createGuestViewModel.loginViewModel(
                              modell: _user);
                          LoginResponse ssduser =
                              _createGuestViewModel.apiResponse.data;
                          print(
                              '---------------tokrn-------token----${ssduser.accessToken}');
                          if (ssduser.accessToken.isNotEmpty) {
                            print('-------------mmmmmm-------------');
                            Get.offAll(OrderHistory());
                          }

                          // Get.offAll(CartScreen());
                        } else {
                          if (_emailController.text.isEmpty &&
                              _passwordController.text.isEmpty) {
                            Get.dialog(
                              AlertDialog(
                                title: Text("Please enter username & password"),
                                // content: Text(
                                //     "This should not be closed automatically"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("CLOSE"),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                        }
                      },
                      minWidth: Responsive.isMobile(context)
                          ? Get.width / 3
                          : Get.width / 6,
                      height: Get.height / 12,
                      color: Color(0xffAB965D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: Responsive.isMobile(context)
                              ? Get.width * .025
                              : Get.width * .011,
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width / 60),
                    Transform.scale(
                      scale: Responsive.isMobile(context)
                          ? Get.width / 1000
                          : Get.width / 2000,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Checkbox(
                            value: isChecked,
                            activeColor: Color(0xffAB965D),
                            onChanged: (bool value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context)
                            ? Get.width * .025
                            : Get.width * .010,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAB965D),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Lost your password?",
                style: TextStyle(
                  color: Color(0xffAB965D),
                  fontSize: Responsive.isMobile(context)
                      ? Get.width * .022
                      : Get.width * .011,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class page extends StatelessWidget {
  const page({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Responsive.isMobile(context) ? Get.width : Get.width / 2,
      decoration: BoxDecoration(
        color: Colors.black45,
        image: DecorationImage(
            image: AssetImage('assets/images/map.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'e Online Ordering',
            style: TextStyle(
              color: Color(0xffAB965D),
              fontSize: 50,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'System',
            style: TextStyle(
              color: Color(0xffAB965D),
              fontSize: 50,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
