import 'package:code_text_field/code_text_field.dart';
import 'package:coding_juniors_assgnment/home_screen.dart';
import 'package:coding_juniors_assgnment/third_que.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  CodeController? _codeController;
  final int _selectedIndex = 0;
  bool _showData = false;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ThirdScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    const source = "void main() {\n    print(\"Hello, world!\");\n}";

    _codeController = CodeController(
      text: source,
      language: dart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Q2: Write a code to multiply two numbers"),
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
            _showData =
                true; // Update _showData to true when FloatingActionButton is pressed
          });
        },
        child: const Icon(
          Icons.play_arrow_sharp,
          color: Colors.teal,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_before),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: 'Next',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
