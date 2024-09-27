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
  String number1 = "";
  String number2 = "";
  String showEquationString = "";
  String mathSymbol = "";

  void resetCalculator() {
    setState(() {
      number1 = "";
      number2 = "";
      showEquationString = "";
      mathSymbol = "";
    });
  }

  void getFirstNumber(final int inputFirstNumber) {
    setState(() {
      number1 = inputFirstNumber.toString();
      showEquationString = number1;
      mathSymbol = "";
      number2 = "";
    });
  }

  void getMathSymbol(final String inputMathSymbol) {
    setState(() {
      if (number1.toString().isEmpty) {
        return;
      }

      if (mathSymbol.isNotEmpty && showEquationString.endsWith(" ")) {
        showEquationString = showEquationString.substring(0, 2) + inputMathSymbol
            + " ";
      } else {
        showEquationString = showEquationString.substring(0, 1) + " " +
            inputMathSymbol + " ";
      }

      mathSymbol = inputMathSymbol;
      number2 = "";
    });
  }

  void getSecondNumber(final int inputSecondNumber) {
    setState(() {
      if (number1.toString().isEmpty || mathSymbol.isEmpty) {
        return;
      }

      showEquationString = showEquationString.substring(0, 4) +
          inputSecondNumber.toString();

      number2 = inputSecondNumber.toString();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    if (number1.isEmpty) {
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
                    // function
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
