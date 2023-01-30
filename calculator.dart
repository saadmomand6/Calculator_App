import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  var userinput = '';
  var answer = '';
  void getanswer(){
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CALCULATOR APP',style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 30),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userinput.toString(),style: const TextStyle(fontSize: 30, color: Colors.white),),
                      const SizedBox(height: 20,),
                      Text(answer.toString(),style: const TextStyle(fontSize: 30, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children:  [
                        MyButtons(title: "AC",color: Colors.grey, onpress:() {
                          userinput = '';
                          answer = '';
                          setState(() {});
                        },),
                        MyButtons(title: "%",color: Colors.grey,onpress:() {
                          userinput += '%';
                          setState(() {});
                        },),
                        MyButtons(title: "Del",color: Colors.grey,onpress:() {
                          userinput = userinput.substring(0, userinput.length-1);
                          setState(() {});
                        },),
                        MyButtons(title: "/",color: Colors.lightBlue,onpress:() {
                          userinput += '/';
                          setState(() {});
                        },),
                    
                      ],
                    ),
                    Row(
                      children:  [
                        MyButtons(title: "7",color: Colors.grey,onpress:() {
                          userinput += '7';
                          setState(() {});
                        },),
                        MyButtons(title: "8",color: Colors.grey,onpress:() {
                          userinput += '8';
                          setState(() {});
                        },),
                        MyButtons(title: "9",color: Colors.grey,onpress:() {
                          userinput += '9';
                          setState(() {});
                        },),
                        MyButtons(title: "x",color: Colors.lightBlue,onpress:() {
                          userinput += 'x';
                          setState(() {});
                        },),
                    
                      ],
                    ),Row(
                      children: [
                        MyButtons(title: "4",color: Colors.grey, onpress:() {
                          userinput += '4';
                          setState(() {});
                        },),
                        MyButtons(title: "5",color: Colors.grey,onpress:() {
                          userinput += '5';
                          setState(() {});
                        },),
                        MyButtons(title: "6",color: Colors.grey,onpress:() {
                          userinput += '6';
                          setState(() {});
                        },),
                        MyButtons(title: "-",color: Colors.lightBlue,onpress:() {
                          userinput += '-';
                          setState(() {});
                        },),
                    
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(title: "1",color: Colors.grey,onpress:() {
                          userinput += '1';
                          setState(() {});
                        },),
                        MyButtons(title: "2",color: Colors.grey,onpress:() {
                          userinput += '2';
                          setState(() {});
                        },),
                        MyButtons(title: "3",color: Colors.grey,onpress:() {
                          userinput += '3';
                          setState(() {});
                        },),
                        MyButtons(title: "+",color: Colors.lightBlue,onpress:() {
                          userinput += '+';
                          setState(() {});
                        },),
                    
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(title: "00",color: Colors.grey,onpress:() {
                          userinput += '00';
                          setState(() {});
                        },),
                        MyButtons(title: "0",color: Colors.grey,onpress:() {
                          userinput += '0';
                          setState(() {});
                        },),
                        MyButtons(title: ".",color: Colors.grey,onpress:() {
                          userinput += '.';
                          setState(() {});
                        },),
                        MyButtons(title: "=",color: Colors.lightBlue,onpress:() {
                          getanswer();
                          setState(() {});
                        },),
                    
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButtons extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButtons({
    required this.color,
    required this.title,
    required this.onpress,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 70,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),),),
          ),
        ),
      ),
    );
  }
}