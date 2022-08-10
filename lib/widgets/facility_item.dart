import 'package:find_house_app/model/facility.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacilityItem extends StatelessWidget {
  final Facility facility;
  const FacilityItem({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          facility.imageUrl,
          width: 32,
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: '${facility.total} ',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: facility.name,
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
