import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String sevenImg = "lib/img/7.png";
  final String eightImg = "lib/img/8.png";
  final String nineImg = "lib/img/9.png";
  final String multipleImg = "lib/img/x.png";
  final String fourImg = "lib/img/4.png";
  final String fiveImg = "lib/img/5.png";
  final String sixImg = "lib/img/6.png";
  final String minusImg = "lib/img/-.png";
  final String oneImg = "lib/img/1.png";
  final String twoImg = "lib/img/2.png";
  final String threeImg = "lib/img/3.png";
  final String addImg = "lib/img/+.png";
  final String ACImg = "lib/img/AC.png";
  final String zeroImg = "lib/img/0.png";
  final String divideImg = "lib/img/divide.png";
  final String equalImg = "lib/img/=.png";
  final String numberSymbolImg = "lib/img/+_-.png";
  final String emptyImg = "lib/img/empty.png";
  String number1 = "";
  String number2 = "";
  String showEquationString = "";
  String mathSymbol = "";
  String finalAnswerString = "";

  void resetCalculator() {
    setState(() {
      number1 = "";
      number2 = "";
      showEquationString = "";
      mathSymbol = "";
      finalAnswerString = "";
    });
  }

  void getFirstNumber(final int inputFirstNumber) {
    setState(() {
      number1 += inputFirstNumber.toString();
      showEquationString = number1;
      mathSymbol = "";
      number2 = "";
      finalAnswerString = "";
    });
  }

  void getMathSymbol(final String inputMathSymbol) {
    setState(() {
      if (number1.isEmpty || number2.isNotEmpty) {
        return;
      }

      if (mathSymbol.isNotEmpty) {
        showEquationString = showEquationString.substring(
            0, showEquationString.length - mathSymbol.length - 1) + inputMathSymbol
            + " ";
      } else {
        showEquationString = "$number1 $inputMathSymbol ";
      }

      mathSymbol = inputMathSymbol;
      number2 = "";
    });
  }

  void getSecondNumber(final int inputSecondNumber) {
    setState(() {
      if (number1.isEmpty || mathSymbol.isEmpty) {
        return;
      }

      number2 += inputSecondNumber.toString();

      showEquationString = "$number1 $mathSymbol $number2";
    });
  }

  void calculateMathEquation() {
    if (number1.isEmpty || mathSymbol.isEmpty || number2.isEmpty) {
      setState(() {
        finalAnswerString = "Input Error";
      });
      return;
    }

    int num1 = int.parse(number1);
    int num2 = int.parse(number2);
    int answer = 0;

    setState(() {
      switch (mathSymbol) {
        case "+":
          answer = num1 + num2;
          finalAnswerString = "Answer: " + answer.toString();
          resetCalculatorForEqual();
          return;
        case "-":
          answer = num1 - num2;
          finalAnswerString = "Answer: " + answer.toString();
          resetCalculatorForEqual();
          return;
        case "x":
          answer = num1 * num2;
          finalAnswerString = "Answer: " + answer.toString();
          resetCalculatorForEqual();
          return;
        case "÷":
          if (num1 == 0 && num2 == 0) {
            finalAnswerString = "Answer: " + num1.toString();
            resetCalculatorForEqual();
            return;
          } else if (num2 == 0) {
            finalAnswerString = "Cannot divide by 0";
            resetCalculatorForEqual();
            return;
          } else {
            double result = num1 / num2;
            finalAnswerString = "Answer: " + result.toString();
            resetCalculatorForEqual();
            return;
          }
        default:
          finalAnswerString = "Calculation Error";
          resetCalculatorForEqual();
          return;
      }
    });
  }

  void resetCalculatorForEqual() {
    setState(() {
      number1 = "";
      number2 = "";
      showEquationString = "";
      mathSymbol = "";
    });
  }

  void changeNumberSymbol() {
    setState(() {
      if (number1.isEmpty) {
        return;
      } else if (mathSymbol.isNotEmpty && number2.isEmpty) {
        return;
      }

      if (number1.isNotEmpty && number2.isNotEmpty) {
        if (number2.startsWith("-")) {
          number2 = number2.substring(1);
        } else {
          number2 = "-$number2";
        }
        showEquationString = "$number1 $mathSymbol $number2";
      } else if (number1.isNotEmpty) {
        if (number1.startsWith("-")) {
          number1 = number1.substring(1);
        } else {
          number1 = "-$number1";
        }
        showEquationString = number1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              finalAnswerString,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(emptyImg),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(emptyImg),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    changeNumberSymbol();
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(numberSymbolImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(emptyImg),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(7);
                    } else {
                      getSecondNumber(7);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(sevenImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(8);
                    } else {
                      getSecondNumber(8);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(eightImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(9);
                    } else {
                      getSecondNumber(9);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(nineImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    getMathSymbol("x");
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(multipleImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(4);
                    } else {
                      getSecondNumber(4);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(fourImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(5);
                    } else {
                      getSecondNumber(5);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(fiveImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(6);
                    } else {
                      getSecondNumber(6);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(sixImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    getMathSymbol("-");
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(minusImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(1);
                    } else {
                      getSecondNumber(1);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(oneImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(2);
                    } else {
                      getSecondNumber(2);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(twoImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(3);
                    } else {
                      getSecondNumber(3);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(threeImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    getMathSymbol("+");
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(addImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    resetCalculator();
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ACImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (mathSymbol.isEmpty) {
                      getFirstNumber(0);
                    } else {
                      getSecondNumber(0);
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(zeroImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    getMathSymbol("÷");
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(divideImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    calculateMathEquation();
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(equalImg),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              showEquationString,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
