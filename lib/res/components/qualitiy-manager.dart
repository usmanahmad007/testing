import 'package:flutter/material.dart';
import 'package:nomo_app/res/colors/appcolors.dart';

class QuantityManager extends StatelessWidget {
  QuantityManager({
    Key? key,
    required this.onRemove,
    required this.onAdd,
    this.value = 0,
  }) : super(key: key);
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.kSeoulColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.remove,
              color: AppColors.blackColor,
              size: 20,
            ),
          ),
          Expanded(
              child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          )
              // MyText(
              //   text: '$value',
              //   weight: FontWeight.w600,
              //   color: kBlackColor2,
              //   align: TextAlign.center,
              // ),
              ),
          GestureDetector(
            onTap: onAdd,
            child: const Icon(
              Icons.add,
              color: AppColors.blackColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
