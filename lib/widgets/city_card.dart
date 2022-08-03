import 'package:find_house_app/model/city.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 55,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36)),
                          ),
                          child: Center(
                            child: Image.asset('assets/Icon_star_solid.png',
                                height: 22, width: 22),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            const SizedBox(height: 11),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
