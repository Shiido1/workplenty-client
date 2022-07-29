enum GigType { FREELANCE, HOME_SERVICE, UNKNOWN, LIVE_SESSION }

String? fromGigType(GigType? type) {
  switch (type) {
    case GigType.FREELANCE:
      return 'FREELANCE';
    case GigType.HOME_SERVICE:
      return 'HOME';
    case GigType.LIVE_SESSION:
      return 'LIVE_SESSION';
    default:
      return '';
  }
}

GigType? toGigType(String? type) {
  switch (type) {
    case 'FREELANCE':
      return GigType.FREELANCE;
    case 'HOME':
      return GigType.HOME_SERVICE;
    case 'LIVE_SESSION':
      return GigType.LIVE_SESSION;
    default:
      return GigType.UNKNOWN;
  }
}
