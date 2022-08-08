import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_payment_app/controllers/data_controller.dart';
import 'package:new_payment_app/pages/payment_page.dart';
import 'package:new_payment_app/pages/utils/colors.dart';
import 'package:new_payment_app/widgets/buttons.dart';
import 'package:new_payment_app/widgets/large_button.dart';
import 'package:new_payment_app/widgets/text_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          width: w,
          child: Stack(
            children: [
              _headerSection(),
              Obx((){
                if(_controller.loading == false) {
                  return const Center(
                      child: CircularProgressIndicator(),
                  );
                }
                else{
                  return _listBills();
                }
              }),
              _payButton(),
            ],
          ),
        ),
      ),
    );
  }
  _headerSection(){
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.73,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _myText(),
        ],
      ),
    );
  }
  _mainBackground(){
    return Positioned(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/backgroundImage.png"),
            ),
          ),
        )
    );
  }
  _curveImageContainer(){
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/curve.png"),
            ),
          ),
        ),
    );
  }
  _buttonContainer(){
    return Positioned(
        bottom: 0,
        right: MediaQuery.of(context).size.height / 17,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet<dynamic>(
                isScrollControlled:true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                        child: Container(
                          color: const Color(0xFFeef1f4).withOpacity(0.7),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height -300,
                        ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height / 2.45,
                      right: 50,
                      child: Container(
                      padding: const EdgeInsets.only(bottom: 25),
                      width: 60,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Buttons(icon: Icons.cancel,
                            onTap: (){
                              Navigator.of(context).pop();
                            }
                            ),
                            const Buttons(
                              text: 'Add',
                              textColor: Colors.white,
                              icon: Icons.add_circle,
                            ),
                            const Buttons(
                                text: "History",
                                textColor: Colors.white,
                                icon: Icons.history),
                          ],
                        ),
                    ),
                    ),
                  ],
                ),
              );
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.width / 6.5,
            width: MediaQuery.of(context).size.width / 6.5,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/lines.png'),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(0, 1),
                  color: const Color(0xFF11324d).withOpacity(0.2),
                ),
              ]
            ),
          ),
        )
    );
  }
  _listBills(){
    return Positioned(
        top: MediaQuery.of(context).size.width / 1.26,
        left: 0,
        bottom: 0,
        right: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: _controller.list.length,
            itemBuilder: (_,index) {
              return Container(
                margin: const EdgeInsets.only(top: 18,right: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 10,left: 18,right: 10,bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 6.5,
                                width: MediaQuery.of(context).size.width / 6.5,
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.red),
                                  image:  DecorationImage(
                                    image: AssetImage(_controller.list[index]["img"]),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  <Widget>[
                                  FittedBox(
                                    child: Text(_controller.list[index]["brand"],
                                      style: const TextStyle(
                                        // fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('ID:8465942',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.idColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedText(text:_controller.list[index]['more'],color: AppColor.green),
                          const SizedBox(height: 3),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  _controller.list[index]["status"] =! _controller.list[index]["status"];
                                  _controller.list.refresh();
                                  print(_controller.newList.length);
                                },
                                child: Container(
                                  child: Center(
                                    child: Text('Select',
                                    style: TextStyle(
                                      color: _controller.list[index]["status"] == false ? Colors.black : Colors.white,
                                    ),
                                    ),
                                  ),
                                  decoration:  BoxDecoration(
                                    color: _controller.list[index]["status"] == false ? AppColor.selectBackground : AppColor.green,
                                    borderRadius: BorderRadiusDirectional.circular(25),
                                  ),
                                  height: 30,
                                  width: 80,
                                ),
                              ),
                              Column(
                                children:  [
                                  FittedBox(
                                    child: Text('\$'+_controller.list[index]["due"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  const FittedBox(
                                    child: Text('Due in three days',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: AppColor.selectColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                decoration:  const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1,1),
                      blurRadius: 20.0,
                      spreadRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width - 30,
                height: 130,
              );
            },
          ),
        ),
    );
  }
  _myText(){
    return   Positioned(
      top: MediaQuery.of(context).size.width * 3.9,
      left: 30,
      child: const Text('My Bills',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 50,
      ),
      ),
    );
  }
  _payButton(){
    return  Positioned(
      bottom: 15,
      child: AppLargeButton(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentPage()));
        },
        text: 'Pay All Bills',
        textColor: Colors.white,
      ),
    );
  }
}
