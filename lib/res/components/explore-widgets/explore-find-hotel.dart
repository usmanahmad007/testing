import 'package:flutter/material.dart';
import 'package:nomo_app/res/components/explore-widgets/explore-find-form.dart';

class ExploreFindHotel extends StatelessWidget {
  const ExploreFindHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        physics: const BouncingScrollPhysics(),
        children: [
          ExploreFindForm(isOnExplorePage: true),
        ],
      ),
    );
  }
}
