
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
class HomePge extends StatefulWidget {
  const HomePge({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePge> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/login.jpg'),
                              fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(30), bottomStart: Radius.circular(30),topEnd: Radius.circular(30), topStart: Radius.circular(30),),
                      ),
                    )),
                  ),
                  // Positioned(
                  //   height: 400,
                  //   width: width+20,
                  //   child: FadeInUp(duration: const Duration(milliseconds: 1000), child: Container(
                  //     decoration: const BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage('assets/login.jpg'),
                  //             fit: BoxFit.fill
                  //         )
                  //     ),
                  //   )),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Login", style: TextStyle(color: Color.fromRGBO(
                      2, 96, 148, 1.0), fontWeight: FontWeight.bold, fontSize: 30),)),
                   Container(height: 30,

                  ),
                  FadeInUp(duration: const Duration(milliseconds: 1700), child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: const Color.fromRGBO( 67, 151, 201, 0.7)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(
                                67, 151, 201, 0.7),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Color.fromRGBO( 67, 151, 201, 0.7)
                              ))
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.grey.shade400)
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey.shade400)
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  const SizedBox(height: 20,),
                  FadeInUp(duration: const Duration(milliseconds: 1700), child: Center(child: TextButton(onPressed: () {}, child: const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO( 2, 96, 148, 1.0)),)))),
                  const SizedBox(height: 20,),
                  FadeInUp(duration: const Duration(milliseconds: 1900), child: MaterialButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    color: const Color.fromRGBO(
                        2, 96, 148, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text("Login", style: TextStyle(color: Colors.white),),
                    ),
                  )),
                  const SizedBox(height: 10,),
                  FadeInUp(duration: const Duration(milliseconds: 2000), child: Center(child: TextButton(onPressed: () {}, child: const Text("Create Account", style: TextStyle(color: Color.fromRGBO( 67, 151, 201, 0.7)),)))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}