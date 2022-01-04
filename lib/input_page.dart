import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_card.dart';
import 'Icon_Context.dart';
import 'constant.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  dynamic gender;
  int height = 180;
  int weight = 60;
  int age = 20;
  bool isbuttomdisable = false;
  bool isagedisable = false;

  void minus() {
    if (weight <= 30) {
      weight = 30;
      isbuttomdisable = true;
    } else {
      weight--;
    }
  }

  void ageminus() {
    if (age <= 10) {
      age = 10;
      isagedisable = true;
    } else {
      age--;
    }
  }

  void addage() {
    setState(() {
      age++;
      isbuttomdisable = false;
    });
  }
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }
  //var cc = true;

  // updateColor(int gender) {
  //   if (gender == 1) {
  //     if (cc == true) {
  //       maleCardColor = activeCardColor;
  //       cc = !cc;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (gender == 2) {
  //     if (cc == true) {
  //       femaleCardColor = activeCardColor;
  //       cc = !cc;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: Mycard(
                      colour: gender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: Iconcontext(
                        icon: FontAwesomeIcons.mars,
                        size: 80,
                        value: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: Mycard(
                      colour: gender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: Iconcontext(
                        icon: FontAwesomeIcons.venus,
                        size: 80,
                        value: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Mycard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: const Color(0xFFEB1555),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Mycard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: '+',
                              backgroundColor: Theme.of(context).primaryColor,
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                size: 15,
                              ),
                              onPressed: !isbuttomdisable
                                  ? () {
                                      setState(() {
                                        minus();
                                      });
                                    }
                                  : null,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  isbuttomdisable = false;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Mycard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: '-',
                              backgroundColor: Theme.of(context).primaryColor,
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                size: 15,
                              ),
                              onPressed: age <= 10
                                  ? null
                                  : () {
                                      setState(() {
                                        ageminus();
                                      });
                                    },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              isDisable: age >= 60 ? true : false,
                              onPressed: () {
                                setState(() {
                                  age++;
                                  isagedisable = false;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/calculate',
                    arguments: CalculatorBrain(height: height, weight: weight));
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text('CALCULATE'),
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

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    @required this.icon,
    required this.onPressed,
    this.isDisable = false,
  }) : super(key: key);

  final IconData? icon;
  final bool isDisable;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.black),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 6,
      onPressed: !isDisable ? onPressed : null,
      shape: const CircleBorder(),
      fillColor: Theme.of(context).primaryColor,
    );
  }
}
