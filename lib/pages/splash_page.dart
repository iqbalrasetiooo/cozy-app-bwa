import 'package:find_house_app/pages/home_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/splash_img.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Logo Cozy
                SvgPicture.asset('assets/logo.svg'),
                const SizedBox(height: 30),
                Text(
                  'Find Cozy House \nto Stay and Happy',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  'Stop membuang banyak waktu \npada tempat yang tidak habitable',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 50,
                  width: 210,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(purpleColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17)))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'Explore Now',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
