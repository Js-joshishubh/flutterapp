import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract_app/util/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton =false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child : SingleChildScrollView(
        child : Form (
          key: _formKey,
          child: Column(
            children: [
           Image.asset("assets/images/hey.png",
            fit: BoxFit.cover,
           ),
           SizedBox(
            height: 20.0,
            ),
           Text(
            "Welcome $name",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          ),
          SizedBox(
            height: 20.0,
          ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
           child: Column(
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Enter User Name",
                   labelText: "User Name",
                 ),
                 validator: (value) {
                   if (value.toString().isEmpty){
                     return "User Name Can Not Be Empty";
                   }
                 },
                 onChanged: (value){
                   name = value;
                   setState(() {});
                 },
               ),
               TextFormField( 
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: "Enter Password",
                   labelText: "Password",
                 ),
                 validator: (value){
                   if (value.toString().isEmpty){
                     return "Password Can Not Be Empty";
                   }
                   else if (value.toString().length < 8){
                     return "Passwroed Should Be 8 Charector Long";

                   }
                   return null;
                 },
               ),
               SizedBox(
                 height: 20.0,
               ),
               Material(
                 color: context.theme.buttonColor,
                 borderRadius: BorderRadius.circular(changeButton ?50 : 8),
               child: InkWell(
                 onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                 width: changeButton ? 50 : 150,
                 height: 50,

                 alignment: Alignment.center,
                 child: changeButton ? Icon(Icons.done,
                   color: Colors.white,)
                     :Text(
                   "Login",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                   ),
                 ),


                 ),

               ),
               ),
               // ElevatedButton(
               //   child: Text("Login"),
               // style: TextButton.styleFrom(
               //   minimumSize: Size(120, 40)
               // ),
               // onPressed: (){
               //     Navigator.pushNamed(context, MyRoutes.HomeRout);
               //
               // },
               //   ),


             ],
           ),
         ),
         ],
      ),
      ),
      ),
    );
  }
}
