// import 'dart:developer';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  
  int counter = 0;

  void incrementFtn() async{
    final SharedPreferences sharedPreferences = await prefs;
    setState(() {
      counter++;
    });

    sharedPreferences.setInt('counterValue', counter);

  }
  void resetFtn(){
    setState(() {
      counter=0;
      
    });
  }
  void getInitialValue() async{
      final SharedPreferences sharedPreferences = await prefs;
    setState((){
     counter = sharedPreferences.getInt ('counterValue') ?? 0;
    });
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitialValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        color: Colors.pink[100],
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              GestureDetector(
                onTap:() =>incrementFtn(),
            
               child: CircleAvatar (
                radius: 100,
                backgroundColor: Colors.pink,
                child: Text(
                  '$counter',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               ),
              ),
             
              Align(
                alignment: Alignment.centerRight,

                child: Padding(
                  padding: const EdgeInsets.only(right:15),
                
                  
                 child:GestureDetector(
                  onTap: () => resetFtn(), 
                   child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                   
                   child: Icon(
                   Icons.refresh,
                    size: 30.0,
                    color: Colors.black,
                   ),
                    // child: Text(
                    //   'Reset',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                   ),
                 ),
              ),
              ),
             
            ],
           ),
        
      ),
        
    );

  }
}