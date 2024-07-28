import 'dart:math';

import 'package:flutter/material.dart';

class CaptachaVerification extends StatefulWidget {
  const CaptachaVerification({super.key});

  @override
  State<CaptachaVerification> createState() => _CaptachaVerificationState();
}

class _CaptachaVerificationState extends State<CaptachaVerification> {
  String randomString = "";
  bool isVerified = false;
  TextEditingController controller = TextEditingController();
  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    // Length of Captcha to be generated
    final random = Random();
    // Select random letters from above list
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    setState(() {});
    print("the random string is $randomString");
  }

  @override
  void initState() {
    super.initState();
    // To generate number on loading of page
    buildCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Flutter Captcha Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Captacha Value",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Shown Captcha value to user
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      randomString,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  width: 10,
                ),
                // Regenerate captcha value
                IconButton(
                    onPressed: () {
                      buildCaptcha();
                    },
                    icon: const Icon(Icons.refresh)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // TextFormField to enter captcha value
            TextFormField(
              onChanged: (value) {
                setState(() {
                  isVerified = false;
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Captcha Value",
                  labelText: "Enter Captcha Value"),
              controller: controller,
            ),
            const SizedBox(
              height: 10,
            ),
            // To check captcha value and
            // textediting controller value
            ElevatedButton(
                onPressed: () {
                  isVerified = controller.text == randomString;

                  setState(() {});
                },
                child: const Text("Check")),
            const SizedBox(
              height: 10,
            ),
            // Output whether captcha is correctly entered or not
            if (isVerified)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.verified), Text("Verified")],
              )
            else
              const Text("Please enter value you see on screen"),
          ],
        ),
      ),
    );
  }
}