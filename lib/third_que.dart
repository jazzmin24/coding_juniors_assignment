import 'package:code_text_field/code_text_field.dart';
import 'package:coding_juniors_assgnment/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  CodeController? _codeController;

  bool _showData = false;

  @override
  void initState() {
    super.initState();
    const source = "void main() {\n    print(\"Hello, world!\");\n}";

    _codeController = CodeController(
      text: source,
      language: dart,
      // theme: monokaiSublimeTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Q3: Write a code to concatenate two numbers"),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                 child: CodeTheme(
                data: const CodeThemeData(styles: monokaiSublimeTheme),
                child: CodeField(
                  controller: _codeController!,
                  textStyle:
                      const TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                ),
              ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 17, 16, 16),
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(color: Colors.teal),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Output',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.teal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const Divider(color: Colors.teal),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_showData)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.withOpacity(0.3),
          onPressed: () {
            setState(() {
              _showData = true;
            });
          },
          child: const Icon(
            Icons.play_arrow_sharp,
            color: Colors.teal,
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            dialogBox(context);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 7.h, bottom: 7.h),
              child: Center(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ));
  }

  Future<dynamic> dialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          // title: Text(
          //   "Submittied",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24.sp,
          //       fontWeight: FontWeight.bold),
          // ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Test Submitted!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.sp),
              Text(
                textAlign: TextAlign.center,
                "The test has been submitted successfully.",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                );
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}


