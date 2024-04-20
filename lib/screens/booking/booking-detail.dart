import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/main.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/booking-widgets/hosted-by.dart';
import 'package:nomo_app/res/components/common-image-view.dart';

class BookingDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 380,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  CommonImageView(
                    height: Get.height,
                    width: Get.width,
                    url: dummyImg4,
                  ),
                  Positioned(
                    top: 50,
                    left: 15,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesRoundedBack,
                            height: 36,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesReport,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesCalendar,
                                height: 20,
                                color: AppColors.kBlackColor2,
                              ),
                              8.horizontalSpace,
                              Text(
                                'Check-in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.kBlackColor2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            'Mon, Oct 09, 2022\n1:00 PM',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesCalendar,
                                height: 20,
                                color: AppColors.kBlackColor2,
                              ),
                              8.horizontalSpace,
                              Text(
                                'Check-out',
                                style: TextStyle(
                                    fontSize: 1.sp,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.kBlackColor2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            'Mon, Oct 09, 2022\n1:00 PM',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reservation details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    15.verticalSpace,
                    Text(
                      'Total cost',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    5.verticalSpace,
                    Text(
                      '\$300.00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 1,
                      color: AppColors.neutralGray,
                    ),
                    20.verticalSpace,
                    Text(
                      'Who is coming',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesEUser,
                          height: 20,
                          color: AppColors.kBlackColor2,
                        ),
                        8.horizontalSpace,
                        Expanded(
                          flex: 0,
                          child: Text(
                            'Who is coming',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: 'Montserrat',
                                color: AppColors.kBlackColor2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Text(
                      '2 Adult 1 Children',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w500),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 1,
                      color: AppColors.neutralGray,
                    ),
                    20.verticalSpace,
                    Text(
                      'Confirmation code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    Text(
                      'HMQBDKAQZ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w500),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 1,
                      color: AppColors.neutralGray,
                    ),
                    20.verticalSpace,
                    Text(
                      'Cancellation policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    Text(
                      'Free cancellation before 1:00 PM on Oct 08. After that, the reservation is non-refundable',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w500),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 1,
                      color: AppColors.neutralGray,
                    ),
                    10.verticalSpace,
                    // MyText(
                    //   paddingTop: 8,
                    //   text:
                    //       'Free cancellation before 1:00 PM on Oct 08. After that, the reservation is non-refundable',
                    //   color: kBlackColor2,
                    //   paddingBottom: 15,
                    // ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesForward,
                          color: AppColors.kBlackColor2,
                          height: 24,
                        ),
                        // Expanded(
                        //   child: MyText(
                        //     onTap: () {
                        //       showModalBottomSheet(
                        //         context: context,
                        //         backgroundColor: Colors.transparent,
                        //         elevation: 0,
                        //         isScrollControlled: true,
                        //         builder: (_) {
                        //           return ChangeReservation();
                        //         },
                        //       );
                        //     },
                        //     paddingLeft: 10,
                        //     text: 'Change reservation',
                        //     size: 14,
                        //     color: AppColors.kBlackColor2,
                        //   ),
                        // ),
                        Image.asset(
                          Assets.imagesForward,
                          height: 24,
                          color: AppColors.kBlackColor2,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       Assets.imagesCancel,
                    //       color: AppColors.kBlackColor2,
                    //       height: 24,
                    //     ),
                    //     Expanded(
                    //       child: MyText(
                    //         onTap: () {
                    //           showModalBottomSheet(
                    //             context: context,
                    //             backgroundColor: Colors.transparent,
                    //             elevation: 0,
                    //             isScrollControlled: true,
                    //             builder: (_) {
                    //               return ConfirmCancellation();
                    //             },
                    //           );
                    //         },
                    //         paddingLeft: 10,
                    //         text: 'Cancel reservation',
                    //         size: 14,
                    //         color: kBlackColor2,
                    //       ),
                    //     ),
                    //     Image.asset(
                    //       Assets.imagesForward,
                    //       height: 24,
                    //       color: AppColors.kBlackColor2,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),

                    Text(
                      'Map',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: AppColors.kBlackColor2,
                          fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    CommonImageView(
                      height: 190,
                      imagePath: Assets.googleMap,
                      radius: 15.0,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    HostedBy(
                      avatarUrl: dummyImg4,
                      name: 'User Name',
                      isVerified: true,
                      rating: 3.0,
                      totalReviews: '2k',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae feugiat nunc. Integer congue fringilla odio non dapibus. Aliquam varius massa sapien, vitae elementum nibh tincidunt ut. Quisque vel eros augue. Nam purus orci, venenatis eget tincidunt non, maximus luctus ligula. Nullam id enim ante. Integer porttitor non ligula id laoreet.',
                      eContactName: 'Raju',
                      eEmail: 'abc@email.com',
                      ePhone: '+ 1 123 4567 8901',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Support(),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // MyButton(
                    //   buttonText: 'Message Host',
                    //   onTap: () {},
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
