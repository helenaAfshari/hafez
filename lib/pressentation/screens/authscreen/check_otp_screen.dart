
import 'dart:async';
import 'package:autharization_hanna/pressentation/screens/authscreen/login_screen.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_checked_otp/bloc_checked_otp.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_checked_otp/event_check_otp.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_checked_otp/state_checked_otp.dart';
import 'package:autharization_hanna/pressentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CheckedOtpScreen extends StatefulWidget {
    final String phoneNumber ;
   const CheckedOtpScreen({super.key, required this.phoneNumber});
  @override
  State<CheckedOtpScreen> createState() => _CheckedOtpScreenState();
}
class _CheckedOtpScreenState extends State<CheckedOtpScreen> {
   // final List<TextEditingController> controllers = List.generate(5, (index) => TextEditingController());
  TextEditingController controller = TextEditingController();
  final CountdownController _controller = CountdownController(autoStart: false);
  late Timer timer;
  bool isCodeInputEnabled = true;
  int initialSeconds = 60;
     @override
  void initState() {
    super.initState();
    startCountdown();
  }
    void startCountdown() {
    _controller.start();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (initialSeconds > 0) {
           initialSeconds--;
        } else {
          // When the countdown reaches 0, stop the timer
          t.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=> CheckedOtpBloc(),
    
    child: SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<CheckedOtpBloc,CheckedOtpState>(
               builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
               Container(
                        height: 200,
                        width: 600,
                        color: const Color.fromARGB(255, 88, 125, 225),
          
                        child: const Center(
                          child: Text("اطلاعات خود را وارد کنید",
                          style: TextStyle(fontSize: 40,color: Colors.white),),
                        )),
        
              const Gap(100),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20),
                     child: Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      focusedPinTheme: const PinTheme(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      defaultPinTheme: const PinTheme(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 88, 125, 225),
                        ),
                      ),
                   androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                      keyboardType: TextInputType.phone,
                      length: 5,
                      obscureText: false,
                      pinAnimationType: PinAnimationType.fade,  
                      animationDuration: const Duration(milliseconds: 300),
                      controller: controller,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        if (isCodeInputEnabled) {
                          print(value);
                        } else {
                          controller.text = '';
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('زمان مجاز برای ورود کد به پایان رسیده است.'),
                            ),
                          );
                        }
                      },
                                 ),
                   ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("didntRecieveOtp"),
                TextButton(
                 onPressed: () {
            if(initialSeconds<=0){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
              }else{
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("نمیرههههههه88888"),
            backgroundColor: Colors.blue,
            ));
              }
                }, child: const Text("recent otp?")),
          
          Countdown(
            controller: _controller,
            seconds: initialSeconds,
            build: (_, double time) {
              int roundedTime = time.toInt();
              return Text(
                '($roundedTime)',
                style: const TextStyle(
            fontSize: 20,
                ),
              );
            },
            interval: const Duration(milliseconds: 100),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
            content: Text('تایمر تمام شد!'),
                ),
              );
              if (initialSeconds > 0) {
                Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),); }},)],),
              Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the code sent to ",
                          children: [
                            TextSpan(
                              text: "${widget.phoneNumber}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(200),
         InkWell(
              onTap: ()  {
              context.read<CheckedOtpBloc>().add(
                CheckedOtpButtomClicked(
            mobileNumber: widget.phoneNumber,
            token: controller.text,
                ),);
              print("Mobile Number: ${widget.phoneNumber}");
              print("OTP: ${controller.text}");
          
            }, 
              child: Container(
               height:60,
               width: 250,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Center(child: Text("getOtp",style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),), ],);},
               listener: (context, state) {
               print("Listener: $state");
               if(state is CheckedOtpSuccess ){
        if(initialSeconds > 0){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => HomeScreen(),
              ),
            );
        }else{
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("کد 555555 شده اشتباه هست"),
              backgroundColor: Colors.blue,
              ));}
          } else if (state is CheckedOtpError) {
            print("Error: ${state.errorMessage}");
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("کد وارد شده اشتباه هست"),
              backgroundColor: Colors.blue,
              ));}}
              ),],),),),),);}
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