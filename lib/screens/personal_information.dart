import 'package:flutter/material.dart';

class personal_information extends StatefulWidget {
  const personal_information({Key? key}) : super(key: key);

  @override
  State<personal_information> createState() => _personal_informationState();
}

class _personal_informationState extends State<personal_information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 60, 8, 5),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("Container clicked");
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: const Color(0XFFEEEEEE),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 1),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0XFFEEEEEE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email,
                        size: 30,
                        color: Colors.black26,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        child: const TextField(
                          cursorColor: Colors.black26,
                          decoration: InputDecoration(
                            //  iconColor: Colors.black,
                            hintStyle: TextStyle(color: Colors.black45),
                            hintText: "Email adress",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0XFFEEEEEE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.black26,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 300,
                        child: const TextField(
                          cursorColor: Colors.black26,
                          decoration: InputDecoration(
                            //  iconColor: Colors.black,
                            hintStyle: TextStyle(color: Colors.black45),
                            hintText: "Phone number",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  // maximumSize: const Size(16.0, 16.0),
                  backgroundColor: const Color(0XFFEDE7F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 18,
                      //color: color,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //onPressed for button 1
                  setState(() {});
                },
                child: const Text(
                  'Send SMS and Verify',
                  style: TextStyle(
                    color: Colors.black45,
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
