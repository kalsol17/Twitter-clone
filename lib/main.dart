import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDE2606)),
      ),
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey=GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage('assets/twitter_blue.png'),
            // width: 100,),
            FaIcon(FontAwesomeIcons.twitter,
            color: Colors.blue,
            size:70),
            SizedBox(height: 20,),
            Text('Log in to Twitter',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration:BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30)
              ),

              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "Enter an Email",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal:20)),
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return ('Please enter an Email');
                  }else if(!emailValid.hasMatch(value)){
                    return 'Please enter a valid Email';
                  }
                  return null;
                },
              ),
            ),
            
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30)
              ),

              child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter a Password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20)),
              validator: (value){
                if(value==null || value.isEmpty){
                  return('Please enter a Password');
                }else if(value.length < 6){
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
        ),
            Container(
              width:200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextButton(onPressed: (){
              if(_signInKey.currentState!.validate()){
              debugPrint('Email:${_emailController.text}');
              debugPrint('Password:${_passwordController.text}');
                }
              },
             child: Text('Log In',
             style: TextStyle(color:Colors.white, fontSize: 18),)
              )
             ),

            TextButton(onPressed: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
            }, 
            child: Text("Don't have an account? Sign up here",
           style: TextStyle(color: Colors.blue), ),
            ),
          ],
        ),
      ),
    );
  }
}
