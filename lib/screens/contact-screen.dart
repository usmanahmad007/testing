import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/controllers/dropdown-controller.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/ProfileWidgets/buttons/send-button.dart';
import 'package:nomo_app/res/components/contact-fields.dart';
import 'package:nomo_app/res/components/dialogs/dialogs.dart';
import 'package:nomo_app/res/components/gradient-app-bar.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final DropdownController dropdownController = Get.put(DropdownController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> prefereceOptions = ['Option 1', 'Option 2', 'Option 2'];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GradientAppBar(
        title: 'Contact Us',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.arrowBack)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              ContactFielsdWidget(
                  controller: nameController, hintText: '', label: 'Full Name'),
              20.verticalSpace,
              ContactFielsdWidget(
                maxLines: 8,
                controller: msgController,
                hintText: '',
                label: 'Message',
              ),
              2.verticalSpace,
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Max 250 words',
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600),
                  )),
              20.verticalSpace,
              fileAttachmentWidget(),
              70.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SendButton(
                    gradient: AppColors.gradientColor,
                    label: 'Send Message',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return ticketDialog();
                          });
                    },
                    width: 280.w),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget fileAttachmentWidget() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Get.defaultDialog(
            //   backgroundColor: AppColors.white,
            //   contentPadding: EdgeInsets.zero,
            //   title: "",
            //   titlePadding: EdgeInsets.zero,
            //   content: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 30.w),
            //     child: Column(
            //       children: [
            //         Text(
            //           'Add Attachment',
            //           style: TextStyle(
            //               fontSize: 16.sp,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w600),
            //         ),
            //         10.verticalSpace,
            //         Text(
            //           'Share a screenshot for a little more \ncontext.',
            //           style: TextStyle(
            //               fontSize: 10.sp,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w600),
            //         ),
            //         20.verticalSpace,
            //         GradientElevatedButton(
            //             gradient: AppColors.gradientColor,
            //             label: 'Add',
            //             onPressed: () {},
            //             width: double.infinity),
            //         20.verticalSpace,
            //         InkWell(
            //           onTap: () {
            //             Get.back();
            //           },
            //           child: Text(
            //             "CANCEL",
            //             style: TextStyle(
            //               color: AppColors.blackColor,
            //               fontSize: 12.sp,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.w600,
            //               decoration: TextDecoration.underline,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          },
          splashColor: Colors.grey.shade100,
          child: Ink(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xffF1F0F0),
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: const Color(0xffF1F0F0), width: 0.5),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.upload,
                  height: 50,
                  width: 50,
                ),
                5.horizontalSpace,
                const Text(
                  'Add Attachment',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        // 12.verticalSpace,
        // InkWell(
        //   onTap: () {
        //     Get.to(() => ChooseTopicScreen());
        //   },
        //   child: Container(
        //     height: 42.h,
        //     width: Get.width,
        //     decoration: BoxDecoration(
        //       color: AppColors.white,
        //       borderRadius: BorderRadius.circular(8),
        //       boxShadow: [
        //         BoxShadow(
        //           color: AppColors.blackColor.withOpacity(0.08),
        //           blurRadius: 16,
        //           spreadRadius: 0,
        //           offset: const Offset(0, 0),
        //         ),
        //       ],
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Choose Topic',
        //             style: TextStyle(
        //                 fontSize: 12.sp,
        //                 fontFamily: 'Montserrat',
        //                 fontWeight: FontWeight.w600),
        //           ),
        //           Icon(
        //             Icons.arrow_forward_ios,
        //             color: AppColors.blackColor,
        //             size: 14.h,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
