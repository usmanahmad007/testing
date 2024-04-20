import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nomo_app/res/colors/appcolors.dart';
import 'package:nomo_app/res/components/buttons/elevated-button.dart';
import 'package:nomo_app/res/components/text-field-widget.dart';
import 'package:nomo_app/screens/auth/create-profile-emoji-screen.dart';

class UsernamePickerScreen extends StatefulWidget {
  const UsernamePickerScreen({super.key});

  @override
  State<UsernamePickerScreen> createState() => _UsernamePickerScreenState();
}

class _UsernamePickerScreenState extends State<UsernamePickerScreen> {
  final TextEditingController nameController = TextEditingController();

  List<String> suggestedUsernames = [];
  String? usernameErrorText;
  bool _showFullList = false;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _checkUsername(String username) {
    // Placeholder for your username check logic
    setState(() {
      if (username.toLowerCase() == 'fazsam') {
        usernameErrorText = 'Vishal is already taken!';
        suggestedUsernames = [
          'fazsam12',
          'fazsam_288',
          'fazsam09',
          'fazsam59',
          'fazsam_18',
          'fazsam19',
        ];
      } else {
        usernameErrorText = null;
        suggestedUsernames = [];
      }
    });
  }

  void _onSuggestionTap(String username) {
    nameController.text = username;
    _checkUsername(username);
  }

  void _toggleFullList() {
    setState(() {
      _showFullList = !_showFullList;
    });
  }

  List<Widget> _buildChips() {
    const int maxVisibleSuggestions = 3;
    List<String> displayUsernames = _showFullList
        ? suggestedUsernames
        : suggestedUsernames.take(maxVisibleSuggestions).toList();

    return displayUsernames.map((username) {
      return GestureDetector(
        onTap: () => _onSuggestionTap(username),
        child: Chip(
          backgroundColor: const Color(0xffE8E8E8),
          side: const BorderSide(
            color: Color(0xffCDCDCD),
          ),
          label: Text(
            username,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .1),
              const Text(
                "Pick a Username",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Color(0xff0F182E)),
              ),
              SizedBox(height: height * .01),
              const Text(
                "You can always choose it later",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Color(0xff768089)),
              ),
              SizedBox(height: height * .04),
              CustomTextFieldWidget(
                  controller: nameController,
                  label: 'Username',
                  hintText: '',
                  onChanged: (value) {
                    _checkUsername(value);
                    return null;
                  }
                  // onValidator: Utils.nameValidator
                  ),
              SizedBox(height: height * .01),
              if (usernameErrorText != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    usernameErrorText!,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              SizedBox(height: height * .1),
              if (suggestedUsernames.isNotEmpty) ...[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Suggested Usernames",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                            color: Color(0xff0F182E)),
                      ),
                      SizedBox(height: height * .015),
                      Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: _buildChips()),
                      SizedBox(height: height * .003),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: _toggleFullList,
                          child: Text(
                            _showFullList ? "View Less" : "View More",
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0F182E)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: height * .1),
              Align(
                alignment: Alignment.center,
                child: GradientElevatedButton(
                    gradient: AppColors.gradientColor,
                    width: 280.w,
                    label: 'Continue',
                    onPressed: () {
                      Get.to(() => const CreateProfileScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
