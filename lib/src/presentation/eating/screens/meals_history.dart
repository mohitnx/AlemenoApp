import 'package:alemenotest/src/constants/constants.dart';
import 'package:alemenotest/src/data/eating/repository/firebase_service.dart';
import 'package:alemenotest/src/presentation/eating/screens/fullscreen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/circular_button.dart';
import '../widgets/circular_button_function.dart';

class MealsHistory extends StatefulWidget {
  static const routeName = '/mealsHistory-screen';
  const MealsHistory({super.key});

  @override
  State<MealsHistory> createState() => _MealsHistoryState();
}

class _MealsHistoryState extends State<MealsHistory> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initilizePhotosList();
  // }

  // initilizePhotosList() async {
  //   await displayPhotos();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                circularButton(
                  radius: 45,
                  iconPath: 'assets/images/back_arrow.svg',
                  function: () => buttonFunction(context),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Text('Past Meals',
                    style: GoogleFonts.andika(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: primaryColor)),
              ],
            )),
      ),
      body: Center(
        child: FutureBuilder(
            future: displayPhotos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: primaryColor,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, FullScreen.routeName,
                              arguments: snapshot.data![index]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            snapshot.data![index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
      ),
    );
  }
}
