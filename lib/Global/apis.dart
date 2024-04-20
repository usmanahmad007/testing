class APIEndpoints {
  static const domain = "https://nomo.faisalayaz.com/api";
  static const signUP = '$domain/auth/signup';
  static const logIn = '$domain/auth/login';
  static const forgotPassbyEmail = '$domain/auth/forgetPasswordByEmail';
  static const verifySignUpOTP = '$domain/auth/verify-signup-otp';
  static const verifyUserOTP = '$domain/auth/verifyUserOtp';
  static const updateuserPassword = '$domain/auth/updateUserPassword';
  static const suggestUsernames = '$domain/auth/suggest-usernames';
  static const updateUser = '$domain/auth/update-user';
  static const myProfile = '$domain/auth/my-profile';
  static const getUserProfile = '$domain/auth/user/profile';
  static const getAllVenues = '$domain/auth/venues';
  static const getMyFavouriteVenues = '$domain/auth/favorite-venues';
  static const addORRemoveFavVenue = '$domain/auth/add-remove-favorite-venue';
  static const getMyVenues = '$domain/auth/user/venues';
  static const getMyPrefrences = '$domain/auth/prefrences';
  static const getAllInterests = '$domain/auth/interests';
  static const createUpdatePref = '$domain/auth/create-update-prefrences';
  static const followUnfollowUser = '$domain/auth/follow-unfollow-user';
  static const socialLogin = '$domain/auth/social-login';
}
