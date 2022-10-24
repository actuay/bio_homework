
class CalculationItem{
  double val1;
  double val2;
  final double diffFac;

  CalculationItem(
      this.val1,
      this.val2,
      this.diffFac,
      );

  String GetCalculationVal1(){
    String calc = "$val1 - ${val1 * diffFac} + ${val2 * diffFac}";
    return calc;
  }

  String GetCalculationVal2(){
    String calc = "$val2 - ${val2 * diffFac} + ${val1 * diffFac}";
    return calc;
  }

}