class Transaction {
  final String content;
  final double amount;

  Transaction({required this.content, required this.amount});

  @override
  String toString() {
    return 'Transaction {content: $content, amount: $amount}';
  }
}
