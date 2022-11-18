class WalletModel {
  final String user;
  final double amount;

  WalletModel({
    required this.user,
    required this.amount,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      user: json['user'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['amount'] = amount;
    return data;
  }
}