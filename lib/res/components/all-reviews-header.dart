import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsHeader extends StatefulWidget {
  const ReviewsHeader({super.key});

  @override
  State<ReviewsHeader> createState() => _ReviewsHeaderState();
}

class _ReviewsHeaderState extends State<ReviewsHeader> {
  @override
  Widget build(BuildContext context) {
    double rating = 3.0;
    const int maxRating = 5;
    const Color activeColor = Colors.orange;
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 2,
            color: Color(0xffEBF1F4),
          ))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '4.6',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff1C1C1C))),
                        const TextSpan(
                            text: '/5',
                            style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1C1C1C))),
                      ],
                    ),
                  ),
                  const Text('86 Reviews',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1C1C1C))),
                ],
              ),
            ),
          ),
          5.horizontalSpace,
          const VerticalDivider(
            endIndent: 10,
            indent: 10,
            color: Color(0xffEBF1F4),
            thickness: 1,
          ),
          10.horizontalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 5.w, bottom: 5.h, top: 5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          allowHalfRating: true,
                          itemCount: maxRating,
                          itemPadding: const EdgeInsets.only(right: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: activeColor,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          color: Colors.grey[300],
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: rating / maxRating,
                            child: Container(
                              color: activeColor,
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          allowHalfRating: true,
                          itemCount: maxRating,
                          itemPadding: const EdgeInsets.only(right: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: activeColor,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          color: Colors.grey[300],
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: rating / maxRating,
                            child: Container(
                              color: activeColor,
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          allowHalfRating: true,
                          itemCount: maxRating,
                          itemPadding: const EdgeInsets.only(right: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: activeColor,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          color: Colors.grey[300],
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: rating / maxRating,
                            child: Container(
                              color: activeColor,
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          allowHalfRating: true,
                          itemCount: maxRating,
                          itemPadding: const EdgeInsets.only(right: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: activeColor,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          color: Colors.grey[300],
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: rating / maxRating,
                            child: Container(
                              color: activeColor,
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          allowHalfRating: true,
                          itemCount: maxRating,
                          itemPadding: const EdgeInsets.only(right: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: activeColor,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rating = rating;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          color: Colors.grey[300],
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: rating / maxRating,
                            child: Container(
                              color: activeColor,
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 0,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
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
