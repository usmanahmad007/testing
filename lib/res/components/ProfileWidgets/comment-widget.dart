import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';

class CommentWdget extends StatelessWidget {
  final VoidCallback? onTap;
  const CommentWdget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Assets.follower1),
          ),
          6.horizontalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8.w, 0.h, 8.w, 10.h),
              constraints: const BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adien Matthew',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Montserrat',
                                color: const Color(0xff111129),
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            '08:16 pm',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                color: Color(0xff111129),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          popupMenuTheme: PopupMenuThemeData(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: AppColors.neutralGray, width: 0.5),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 0.5,
                          ),
                        ),
                        child: PopupMenuButton<String>(
                          padding: EdgeInsets.zero,
                          color: AppColors.white,
                          icon: const Icon(
                            Icons.more_horiz_rounded,
                            color: Color(0xffADADAD),
                          ),
                          itemBuilder: (context) {
                            String selectedItem = '';
                            return [
                              PopupMenuItem<String>(
                                onTap: () {
                                  selectedItem = 'delete';
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (_) {
                                  //       return deleteDialog();
                                  //     });
                                },
                                padding: EdgeInsets.zero,
                                value: 'delete',
                                child: Container(
                                  height: 43,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: selectedItem == 'delete'
                                        ? AppColors.gradientColor
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: selectedItem == 'delete'
                                              ? AppColors.white
                                              : AppColors.blackColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  selectedItem = 'edit';
                                },
                                value: 'edit',
                                child: Container(
                                  height: 43,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: selectedItem == 'edit'
                                        ? AppColors.gradientColor
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: selectedItem == 'edit'
                                              ? AppColors.white
                                              : AppColors.blackColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          onSelected: (String value) {
                            print('You Click on pop up menu item');
                            if (value == 'delete') {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return deleteDialog();
                                  });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa.',
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        color: Color(0xff111129),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
