enum Environment { development, staging, qa, production }

class UrlConfig {
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';
  static const String verificationPinRequest = 'verification-pin/request';
  static const String verificationPinConfirm = 'verification-pin/confirm';

  static const String saveIndustry = 'client/industry/save';
  static const String listIndustry = 'client/industry/list';
  static const String deleteIndustry = 'client/industry/delete';
  static const String overviewPayment = 'client/payment/overview';
  static const String transactionPayment = 'client/payment/transactions';
  static const String depositPayment = 'client/payment/deposit';

  static const String listCard = 'client/payment/card/list';
  static const String saveCard = 'client/card/save';
  static const String removeCard = 'client/card/remove';

  static const String profileBioUpdate = 'client/profile/update-bio';
  static const String profileLocationUpdate = 'client/profile/update-location';
  static const String profileAvatarUpdate = 'client/profile/update-avatar';

  static const String saveGig = 'client/gig/save';
  static const String removeAttachment = 'client/attachments/remove';

  static const String listBid = 'client/bids/list';
  static const String acceptOrDeclineBid = 'client/bids/accept-or-decline';
}
