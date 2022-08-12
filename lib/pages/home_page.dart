import 'package:find_house_app/model/city.dart';
import 'package:find_house_app/model/space.dart';
import 'package:find_house_app/model/tips.dart';
import 'package:find_house_app/widgets/bottom_navbar_item.dart';
import 'package:find_house_app/widgets/city_card.dart';
import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/space_card.dart';
import 'package:find_house_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            const SizedBox(height: 24),
            //NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            //NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CityCard(
                      city: City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      city: City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      city: City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            //NOTE: RECOMMENDED SPACES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  SpaceCard(
                    space: Space(
                        id: 1,
                        name: 'Kuretakeso Hott',
                        imageUrl: 'assets/space1.png',
                        price: 52,
                        city: 'Bandung',
                        country: 'Germany',
                        rating: 4),
                  ),
                  const SizedBox(height: 30),
                  SpaceCard(
                    space: Space(
                        id: 2,
                        name: 'Roemah Nenek',
                        imageUrl: 'assets/space2.png',
                        price: 11,
                        city: 'Seattle',
                        country: 'Bogor',
                        rating: 5),
                  ),
                  const SizedBox(height: 30),
                  SpaceCard(
                    space: Space(
                        id: 3,
                        name: 'Darrling How',
                        imageUrl: 'assets/space3.png',
                        price: 20,
                        city: 'Jakarta',
                        country: 'Indonesia',
                        rating: 3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TipsCard(
                    tips: Tips(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/tips1.svg',
                        updatedAt: '20 Apr'),
                  ),
                  const SizedBox(height: 20),
                  TipsCard(
                    tips: Tips(
                        id: 2,
                        title: 'Jakarta Fairship',
                        imageUrl: 'assets/tips2.svg',
                        updatedAt: '11 Dec'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const SizedBox(
              height: 50 + 24,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: const Color(0xfff6f7f8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavbarItem(
              imageUrl: 'assets/Icon_home_solid_active.svg',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_mail_solid.svg',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_card_solid.svg',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_love_solid.svg',
            ),
          ],
        ),
      ),
    );
  }
}
