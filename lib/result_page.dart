import 'package:flutter/material.dart';
import 'constant.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cal = ModalRoute.of(context)!.settings.arguments as CalculatorBrain;

    CalculatorBrain res =
        CalculatorBrain(height: cal.height, weight: cal.weight);

    // print(res.calculateBMI());
    // print(res.result());

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    child: Text(
                      'Your result',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              res.result(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.greenAccent),
                            ),
                          ),
                          Container(
                            child: Text(
                              res.calculateBMI(),
                              style: const TextStyle(fontSize: 60),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                res.getInterpreatation(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: activeCardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text('RECALCULATE'),
                //margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
