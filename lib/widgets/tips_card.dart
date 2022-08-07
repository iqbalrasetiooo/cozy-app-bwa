import 'package:find_house_app/model/tips.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        tips.imageUrl,
        width: 80,
        height: 80,
      ),
      title: Text(
        tips.title,
        style: blackTextStyle.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        'Updated ${tips.updatedAt}',
        style: greyTextStyle,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.chevron_right,
          color: greyColor,
          size: 24,
        ),
      ),
    );
    // return Row(
    //   children: [
    //     SvgPicture.asset(
    //       'assets/tips1.svg',
    //       width: 80,
    //     ),
    //     const SizedBox(width: 16),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'City Guidelines',
    //           style: blackTextStyle.copyWith(fontSize: 18),
    //         ),
    //         const SizedBox(height: 4),
    //         Text('Updated 20 Apr', style: greyTextStyle),
    //         const Spacer(),
    //         IconButton(
    //           onPressed: () {},
    //           icon: const Icon(
    //             Icons.chevron_right,
    //             size: 24,
    //             color: greyColor,
    //           ),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}
