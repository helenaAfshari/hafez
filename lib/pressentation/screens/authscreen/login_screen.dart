
import 'package:autharization_hanna/core/resource/constants/my_strings.dart';
import 'package:autharization_hanna/pressentation/screens/authscreen/check_otp_screen.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_login/event_login.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_login/login_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_login/state_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key});
 TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginOtpBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 5, 24, 232),
            title: const Center(child: Text(MyStrings.enterNumber)),
          ),
          body: 
          BlocConsumer<LoginOtpBloc, LoginOtpState>(
 listener: (context, state) {
  print("Listener: $state");
  if (state is LoginOtpSuccess) {
    print("Navigating to HomeScreen");
    Navigator.pushReplacement(
      context,
     MaterialPageRoute(
       builder: (context) => CheckedOtpScreen(phoneNumber: controller.text),
       //builder: (context) => Hhhhh(phoneNumber:controller.text ),
     ),
    );
  } else if (state is LoginOtpError) {
    // اضافه کردن چک کنید که در صورت خطا، پیام خطا نمایش داده شود
    print("Error: ${state.errorMessage}");

  }
},

  builder: (context, state) {
    print("Builder: $state");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60,left: 50,right: 50),
          child: Container(
            color: const Color.fromARGB(255, 213, 220, 241),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: controller,
              decoration: const InputDecoration(
                hintText: "شماره موبایل خود را وارد کنید ",
              ),
            ),
          ),
        ),
        Gap(30),
            InkWell(
          onTap: () {
            context.read<LoginOtpBloc>().add(
                  LoginOtpButtonClicked(
                    mobileNumber: controller.text,
                  ),
                );
          },
          child: Container(
           height:60,
           width: 250,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Center(child: Text("enter",style: TextStyle(fontSize: 20,color: Colors.white),)),
          ),
        )
        // ElevatedButton(
        //   onPressed: () {
        //     context.read<LoginOtpBloc>().add(
        //           LoginOtpButtonClicked(
        //             mobileNumber: controller.text,
        //           ),
        //         );
        //   },
        //   child: Text("ورود"),
        // ),
      ],
    );
  },
),

        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Center(
//         child: Text("صفحه Home"),
//       ),
//     );
//   }
// }






