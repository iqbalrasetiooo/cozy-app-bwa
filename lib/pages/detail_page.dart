import 'package:find_house_app/model/facility.dart';
import 'package:find_house_app/pages/error_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/thumbnail.png',
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kuretekaso Hott',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                const SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$52 ',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: '/ Month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/Icon_star_solid.png',
                                  width: 20,
                                ),
                                const SizedBox(width: 2),
                                Image.asset(
                                  'assets/Icon_star_solid.png',
                                  width: 20,
                                ),
                                const SizedBox(width: 2),
                                Image.asset(
                                  'assets/Icon_star_solid.png',
                                  width: 20,
                                ),
                                const SizedBox(width: 2),
                                Image.asset(
                                  'assets/Icon_star_solid.png',
                                  width: 20,
                                ),
                                const SizedBox(width: 2),
                                Image.asset(
                                  'assets/Icon_star_solid.png',
                                  width: 20,
                                  color: const Color(0xff989BA1),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      //NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(left: edge, right: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              facility: Facility(
                                name: 'kitchen',
                                total: 2,
                                imageUrl: 'assets/icon_kitchen.svg',
                              ),
                            ),
                            FacilityItem(
                              facility: Facility(
                                name: 'bedroom',
                                total: 3,
                                imageUrl: 'assets/icon_bedroom.svg',
                              ),
                            ),
                            FacilityItem(
                              facility: Facility(
                                name: 'Big Lemari',
                                total: 3,
                                imageUrl: 'assets/icon_cupboard.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: edge),
                            Image.asset(
                              'assets/photo1.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 18),
                            Image.asset(
                              'assets/photo2.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 18),
                            Image.asset(
                              'assets/photo3.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: edge),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      //NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jln. Kappan Sukses No. 20\nPalembang',
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () async {
                                final maps = Uri.parse(
                                    'https://www.google.com/maps/place/Alun+alun+Haurgeulis/@-6.4576568,107.9405106,15z/data=!4m5!3m4!1s0x2e693730da4e02a3:0x1019e5dfd209eada!8m2!3d-6.4596078!4d107.9434459');
                                if (await UrlLauncher.canLaunchUrl(maps)) {
                                  UrlLauncher.launchUrl(maps);
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ErrorPage(),
                                    ),
                                  );
                                }
                              },
                              child:
                                  SvgPicture.asset('assets/btn_location.svg'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () async {
                              final phone = Uri.parse('tel:081324626295');
                              if (await UrlLauncher.canLaunchUrl(phone)) {
                                UrlLauncher.launchUrl(phone);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ErrorPage(),
                                  ),
                                );
                              }
                            },
                            // onPressed: () {
                            //   UrlLauncher.launchUrl(
                            //       Uri.parse('tel:081324626295'));
                            // },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                purpleColor,
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/btn_back.svg',
                      width: 40,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/btn_wishlist.svg',
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
