import 'package:flutter/material.dart';
//  Gives access to UI components


//  Statefull makes the widget able to change over time
class LoginPage extends StatefulWidget{
    //  Contructs the widget 
    LoginPage();
    
    //  creates the state(holds the things that can change in the app, like the text inside a text field or whether the password is visible.)
    //  _LoginPageState is the class that will manage how the page looks and behaves(UI components like buttons and text fields).
    //  State<LoginPage> acts as a placeholder for the actual ui and create start connects the class to the widget 
    @override
    State<LoginPage> createState() => _LoginPageState();

} 

// this is where all the elements and how they behave are defined
// State<LoginPage> tells Flutter this class manages the state for LoginPage
class _LoginPageState extends State<LoginPage> {
  //  TextEditingController is a tool that allows us to control the text inside the boxes
  // _emailController and _passwordController are like vars that store the text users type into the email and password fields
  // _isPasViible is a bool tracking whether or not the password should be visible or not
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false ;

  //override means you are overriding a method from the superclass, used just in case
  @override

  //build contructs the UI
  //Call this whenever the widgets state changes(ex:password visibility is toggled)
  Widget build(BuildContext context)  {
    
    //  Scaffold is the basic structure of the apps screen. Provides a background/body etc
    return Scaffold(
      //  Center centers all the ui elements inside the body of the screen
      body: Center(
        //  padding adds space around the child elements (in this case the login form)
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
            //  column lays everythin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                //  Adds spacing 
                SizedBox(height: 20),
                
                //  Email Input Field
                TextField(
                  //  connects text field to TextEditingController that stores the email
                  controller: _emailController, 
                  //  customizes appearance of input field. Adds label "email", a border and email icon inside the field 
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  //  changes keyboard layout to make typing email easier(shows @ and "." keys for easier email typing etc)
                  //  not necessary but good practice
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20),

                TextField(
                  //  same as email in but for pass 
                  controller: _passwordController,
                  //  makes the password not visible as defined by the "_isPasswordVisible" var above
                  obscureText: !_isPasswordVisible,
                  //  same as email in but for pass
                  decoration: InputDecoration(
                      //  same as email in but for pass
                      labelText: "Enter Password",
                      //  same as email in but for pass
                      border: OutlineInputBorder(),
                      //Displays icon inside text field
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,

                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Logged in as ${_emailController.text}"),
                          ),
                        );
                      },
                      child: Text("Login"),
                    ),
                  ),
                ],
            ),
        ),
      ));
  }
}         