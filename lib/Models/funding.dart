class funding {
  String fundingId;
  String starter; /// the starter of the funding
  List<dynamic> giftees; /// the giftees of the funding
  String photoUrl;
  String fundingTitle;
  String fundingInfo;
  dynamic fundingProduct; /// the product of the funding (what for?)
  Map fundingMoney; /// current amount and target amount
  Map fundingDates; /// started date and expected ending date
  /// other infos to be added later.

  funding({
    this.fundingId,
    this.starter,
    this.giftees,
    this.photoUrl,
    this.fundingTitle,
    this.fundingInfo,
    this.fundingProduct,
    this.fundingMoney,
    this.fundingDates
  });
}