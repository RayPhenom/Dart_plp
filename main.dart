void main() {
  List<double> cart = [50.0, 20.0, 8.0, 12.5, 100.0];

  double tax = 0.08;

  List<double> filteredCart = cart.where((item) => item >= 10).toList();
  print("Filtered cart: $filteredCart");

  double totalBeforeDiscount = calculateTotal(filteredCart);
  print("Total before discount: \$${totalBeforeDiscount.toStringAsFixed(2)}");

  List<double> discountedCart = applyDiscount(filteredCart, (price) => price * 0.90);
  double totalAfterDiscount = calculateTotal(discountedCart);
  print("Total after 10% discount: \$${totalAfterDiscount.toStringAsFixed(2)}");

  double totalWithTax = calculateTotal(discountedCart, tax: tax);
  print("Total with tax: \$${totalWithTax.toStringAsFixed(2)}");

  double finalTotal = totalWithTax;
  int numberOfItems = discountedCart.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems) / 100;
  finalTotal -= finalTotal * factorialDiscount;
  print("Final total after factorial discount (${numberOfItems}!): \$${finalTotal.toStringAsFixed(2)}");
}

double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = prices.reduce((value, element) => value + element);
  return total * (1 + tax);
}

List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

int calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * calculateFactorialDiscount(n - 1);
}
