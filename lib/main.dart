import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: gstCalculator(),
    );
  }
}

class gstCalculator extends StatefulWidget {


  @override
  _gstCalculatorState createState() => _gstCalculatorState();
}

class _gstCalculatorState extends State<gstCalculator> {
  String result = '' ;
double cost = 0;
double discount = 0;
double cgst = 0;
double sgst = 0;
TextEditingController costController = TextEditingController();
TextEditingController discountController = TextEditingController();
TextEditingController cgstController = TextEditingController();
TextEditingController sgstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
        leading: Icon(Icons.home),
        actions: [
          Icon(Icons.more_vert),
          SizedBox(
            width: 20.0,
          )
        ],
          title: Text('GST CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
          backgroundColor: Colors.red[800],
          centerTitle: true,
          elevation: 0.0,
        ),
        body:  Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Cost Amount',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: costController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter the Cost Amount of the Product',
                      filled: true,
                      fillColor: Colors.red[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                  SizedBox(height: 15.0,),
                Text('Dicount',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: discountController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter the Dicount % on Product',
                      filled: true,
                      fillColor: Colors.red[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  
                   Text('CGST%',
                       style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: cgstController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter the rate of CGST',
                      filled: true,
                      fillColor: Colors.red[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Text('SGST%',
                       style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: sgstController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter the rate of SGST',
                      filled: true,
                      fillColor: Colors.red[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                SizedBox(height: 15.0,),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(onPressed: () {
                    setState(() {
                      double cost = double.parse(costController.value.text);
                    double discount = double.parse(discountController.value.text);
                    double cgst = double.parse(cgstController.value.text);
                    double sgst = double.parse(sgstController.value.text);
                    calculate_payable_amount(cost, discount, cgst, sgst);
                    });
                    
                  },
                  color: Colors.red[800],
                   child: Text('Calculate',
                   style: TextStyle(
                     color: Colors.white,
            
                   ),),
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  width: double.infinity,
                  child: Text('Final Payable prize is : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                 SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  child: Text('$result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                  ],
                
              ),
            ),
            )

            
      ),
    );
  }
    void calculate_payable_amount(double cost, double discount, double cgst, double sgst){
      double after_discount = cost - (cost*discount)/100;
      double after_sgst = (after_discount*sgst)/100;
      double after_cgst = (after_discount*cgst)/100;
      double finalresult = after_discount + after_sgst + after_cgst;
      String payable_amount = finalresult.toStringAsFixed(2);
      setState(() {
        result = payable_amount;
      });
    }
}