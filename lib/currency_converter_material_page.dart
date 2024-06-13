//backend logic
// 1 - create a variable that stores the converted currency value
//2 - function that multiply the value that is give by text-field with exchange rate may be 81
//3 - store the value that we created
//4- display

import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {

//backend value storage variable
  double result = 0;

//controller to control the value to get accessed
  final TextEditingController textEditingController = TextEditingController();

  void convert(){

//controller giving  the value to  button  and storing ur result in variable result
    result = double.parse(textEditingController.text) * 83.52;

// triggers the rebuild using build function
    setState(() {});
  }

//initState function
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



//dispose function
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //////printing result value in app by converting it from int to string because text can only gives string value
              ///int -> string integer_value.toString()
              ///string -> int int.parse(String_value)
          //inr printing or converted value
              Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

          // text field start from here to get input
              TextField(
                //
                //controller getting value
                controller: textEditingController,

                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'please enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),

          const SizedBox(height: 10,),


          //button - raised, appears like a text
              TextButton(
                onPressed: () {
////////// convert function is used here
                  convert();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
