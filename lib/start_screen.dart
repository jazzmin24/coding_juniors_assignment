import 'package:coding_juniors_assgnment/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200.h),
            Text('Instruction',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 34.sp,
                    fontStyle: FontStyle.italic)),
            SizedBox(height: 20.h),
            Text(
              '1. Read the instructions carefully before the test begins.\n\n2. Plan your approach in order to solve problem algorithms.\n\n3. Manage your time effectively to allocate and sufficient focus to each task.\n\n4. Test your solutions rigorously against all the provided test cases.\n\n5. Write clean, readable code with meaningful variable names and comments',
              style: TextStyle(fontSize: 17.sp, color: Colors.white),
            ),
            SizedBox(height: 70.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Center(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 7.h, bottom: 7.h),
                    child: Text(
                      'Start The Test',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
