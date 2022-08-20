import 'package:find_house_app/model/facility.dart';
import 'package:find_house_app/model/space.dart';
import 'package:find_house_app/pages/error_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/facility_item.dart';
import 'package:find_house_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class DetailPage extends StatefulWidget {
  final Space space;

  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: purpleColor,
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu ingin menghubungi pemilik kos?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ya'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  final phone = Uri.parse('tel:${widget.space.phone}');
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
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
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
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                const SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price} ',
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
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rating,
                                  ),
                                );
                              }).toList(),
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
                                total: widget.space.numberOfKitchens,
                                imageUrl: 'assets/icon_kitchen.svg',
                              ),
                            ),
                            FacilityItem(
                              facility: Facility(
                                name: 'bedroom',
                                total: widget.space.numberOfBedrooms,
                                imageUrl: 'assets/icon_bedroom.svg',
                              ),
                            ),
                            FacilityItem(
                              facility: Facility(
                                name: 'Big Lemari',
                                total: widget.space.numberOfCupboards,
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
                          children: widget.space.photos.map<Widget>((item) {
                            return Container(
                              margin: EdgeInsets.only(left: edge),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
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
                              '${widget.space.address},\n${widget.space.city}',
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () async {
                                final maps = Uri.parse(widget.space.mapUrl);
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
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () {
                              showConfirmation();
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Image.asset(
                      isSelected
                          ? 'assets/btn_wishlist_selected.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
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
