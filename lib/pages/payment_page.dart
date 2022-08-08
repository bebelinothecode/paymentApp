import 'package:flutter/material.dart';
import 'package:new_payment_app/widgets/buttons.dart';
import 'package:new_payment_app/widgets/large_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // print(h);
    // print(w);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/paymentbackground.png"),
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              const SizedBox(height: 75),
              Image.asset("assets/images/success.png",
              width: w/1.875,
              height: 100,
              ),
              const Text('Success !',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 5),
              const Text('Payment is complete for two bills',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 10,top: 10,right: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(Icons.done,
                          color: Colors.white,
                          size: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Column(
                          children: const <Widget>[
                            Text('KenGen Power',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            ),
                            SizedBox(height:8),
                            Text('ID:67558688',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                        const Text('\$455600',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(thickness: 2),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 10,right: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(Icons.done,
                            color: Colors.white,
                            size: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Column(
                          children: const <Widget>[
                            Text('KenGen Power',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height:8),
                            Text('ID:67558688',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                        const Text('\$455600',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ) ,
              ),
              const SizedBox(height: 20),
              const Text('Total Amount',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text('\$2840.00',
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: h * 0.18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Buttons(
                      icon: (Icons.share),
                      text: "Share",
                  ),
                  Buttons(
                    icon: (Icons.print),
                    text: "Print",
                  ),
                ],
              ),
              SizedBox(height: h * 0.04),
              AppLargeButton(
                text: 'Done',
                textColor: Colors.white,
                onTap: (){
                  Navigator.of(context).pop();
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
