enum PaymentType { cash, card, unknown }

String? fromPaymentType(PaymentType? type) {
  switch (type) {
    case PaymentType.cash:
      return 'Cash';
    case PaymentType.card:
      return 'Card';
    default:
      return '';
  }
}

PaymentType? toPaymentType(String? type) {
  switch (type) {
    case 'Cash':
      return PaymentType.cash;
    case 'Card':
      return PaymentType.card;
    default:
      return PaymentType.unknown;
  }
}
