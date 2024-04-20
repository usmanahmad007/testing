import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/assets/assets.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/screens/venues/venue-detail-screen.dart';

enum VenueStatus { approved, pending, rejected }

class Venue {
  final String name;
  final String description;
  final double rating;
  final VenueStatus status;

  Venue({
    required this.name,
    required this.description,
    required this.rating,
    required this.status,
  });
}

final List<Venue> venues = [
  Venue(
      name: 'Nature Pure, Hotel',
      description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
      rating: 4.7,
      status: VenueStatus.approved),
  Venue(
      name: 'Nature Pure, Hotel',
      description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
      rating: 4.7,
      status: VenueStatus.rejected),
  Venue(
      name: 'Nature Pure, Hotel',
      description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
      rating: 4.7,
      status: VenueStatus.pending),
];

class MyAllVenues extends StatelessWidget {
  const MyAllVenues({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: venues.length,
      itemBuilder: (context, index) {
        return buildVenueCard(venues[index]);
      },
    );
  }

  Widget buildVenueCard(Venue venue) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: AppColors.white, // Default color for non-rejected cards
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          color: AppColors.neutralGray.withOpacity(0.2),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ],
    );

    if (venue.status == VenueStatus.rejected) {
      boxDecoration = boxDecoration.copyWith(
          border: Border.all(color: Color(0xff979797), width: 1),
          color: Color(0xffF1F0F0));
    }
    return GestureDetector(
      onTap: () {
        Get.to(() => const VenueDetailScreen());
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: double.infinity),
        margin: EdgeInsets.only(bottom: 10.h),
        width: double.infinity,
        decoration: boxDecoration,
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 75.h,
                width: 110.w,
                margin: EdgeInsets.only(left: 6.w, top: 3.h, bottom: 3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(Assets.resortImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        venue.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: "Montserrat"),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Assets.locationBlack),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              venue.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Color(0xff6F6E6E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: Color(0xffFFC107),
                                size: 20,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                '${venue.rating}',
                                style: const TextStyle(
                                    color: Color(0xff6F6E6E),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat"),
                              )
                            ],
                          ),
                          _buildStatusWidget(venue.status)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget(VenueStatus status) {
    switch (status) {
      case VenueStatus.approved:
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: 22,
          width: 75.w,
          decoration: BoxDecoration(
            gradient: AppColors.gradientColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            'Approved',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case VenueStatus.pending:
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: 22,
          width: 75.w,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.pending,
                height: 12,
              ),
              SizedBox(width: 4.w),
              Text(
                'Pending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      case VenueStatus.rejected:
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: 22,
          width: 75.w,
          decoration: BoxDecoration(
            color: AppColors.orangeColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            'Rejected',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  // Color _getStatusColor(VenueStatus status) {
  //   switch (status) {
  //     case VenueStatus.approved:
  //       return Colors.green;
  //     case VenueStatus.pending:
  //       return Colors.orange;
  //     case VenueStatus.rejected:
  //       return Colors.red;
  //     default:
  //       return Colors.grey;
  //   }
}

String _getStatusText(VenueStatus status) {
  switch (status) {
    case VenueStatus.approved:
      return 'Approved';
    case VenueStatus.pending:
      return 'Pending';
    case VenueStatus.rejected:
      return 'Rejected';
    default:
      return 'Unknown';
  }
}
