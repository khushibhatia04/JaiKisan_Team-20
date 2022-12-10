// ignore_for_file: unnecessary_new, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:developer';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class map_page extends StatefulWidget {
  const map_page({Key? key}) : super(key: key);

  @override
  State<map_page> createState() => _MapPageState();
}

class _MapPageState extends State<map_page> {
  bool _isLoading = false;

  var address1 = "mumbai";

  var address2 = "Delhi";

  TextEditingController _text1 = TextEditingController();
  TextEditingController _text2 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/vectors/abstract-flat-man-in-hat-attacked-by-a-green-snake-protected-with-a-vector-id1328373299?k=6&m=1328373299&s=612x612&w=0&h=JVj5SquyjlEGGl0egz2uCzbedzoyqrmR3yfa_oDzF-g="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 85),

                  //address1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 246, 246),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: _text1,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus();
                          },
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 248, 245, 245),
                            hintText: 'Address 1',
                          ),
                          validator: (value) => value!.isEmpty
                              ? "PLease enter first address!"
                              : null,
                          onSaved: (value) {
                            print("address doneeeeeeeeeee" + address1);
                            address1 = value!;
                            print("address doneeeeeeeeeee" + address1 + value);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //address2 textfield

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 245, 245),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: _text2,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address 2',
                          ),
                          validator: (value) => value!.isEmpty
                              ? "Please enter second address!"
                              : null,
                          onSaved: (value) {
                            address2 = value!;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('MAP'),
                          //onPressed: _onSubmit,
                          onPressed: () {
                            map();
                          },
                        ),
                      ),
                    ),
                  ),

                  _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          width: double.infinity,
                          child: SizedBox(),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  map() async {
    final availableMaps = await MapLauncher.installedMaps;
    final AndroidIntent intent = new AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull("https://www.google.com/maps/dir/?api=1&origin=" +
            _text1.text +
            "&destination=" +
            _text2.text +
            "&travelmode=driving&dir_action=navigate"),
        package: 'com.google.android.apps.maps');
    intent.launch();
  }
}
