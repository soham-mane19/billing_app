import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vyapar_app/CustomerModel.dart';
import 'package:vyapar_app/HomeScreen.dart';
import 'package:vyapar_app/SaleScree.dart';

class AdditemScreen extends StatefulWidget {
  const AdditemScreen({super.key});

  @override
  State<AdditemScreen> createState() => _AdditemScreenState();
}

class _AdditemScreenState extends State<AdditemScreen> {
  TextEditingController rateCon = TextEditingController();
  TextEditingController quantityCon = TextEditingController();
  TextEditingController itemCon = TextEditingController();
  TextEditingController totalAmountCon = TextEditingController();
  TextEditingController disCon = TextEditingController();
  TextEditingController disPriceCon = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String taxInfo = "Without Tax";
  String? unitInfo;
  List<String> tax = ['With tax', 'Without Tax'];
  List<String> unitList = [
    'kg',
    'Ltr',
    'Mtr',
    'MI',
    'PACKS',
    'PIECES',
    'TABLETS'
  ];
  double subTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Form(
        key: globalKey,
        child: Column(children: [
          Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        " Add item to Sale",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Spacer(),
                      const Icon(
                        Icons.settings_outlined,
                        size: 25,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: TextFormField(
                    controller: itemCon,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)),
                        labelText: 'Item Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Please Enter the item Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          controller: quantityCon,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              labelText: 'Quantity'),
                          onChanged: (value) {
                            double totalQun =
                                double.tryParse(quantityCon.text)!;
                            double totalRate = double.tryParse(rateCon.text)!;
                            setState(() {
                              subTotal = totalQun * totalRate;
                              totalAmountCon.text = subTotal.toString();
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                              hint: const Text('units'),
                              value: unitInfo,
                              items: unitList.map((String unitName) {
                                return DropdownMenuItem(
                                    value: unitName, child: Text(unitName));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  unitInfo = value!;
                                });
                              })),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          controller: rateCon,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              labelText: 'Rate(Price/unit)'),
                          onChanged: (value) {
                            double totalQun =
                                double.tryParse(quantityCon.text)!;
                            double totalRate = double.tryParse(rateCon.text)!;
                            setState(() {
                              subTotal = totalQun * totalRate;
                              totalAmountCon.text = subTotal.toString();
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            value: taxInfo,
                            items: tax.map((String taxinfo) {
                              return new DropdownMenuItem<String>(
                                value: taxinfo,
                                child: new Text(taxinfo),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                taxInfo = value!;
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ])),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Totals & Taxes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Subtotal (Rate x Qty)",
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.currency_rupee,
                        size: 20,
                      ),
                      //subtotoal
                      Text("$subTotal"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Discount",
                      ),
                      const Spacer(),
                      Container(
                        width: 90,
                        height: 50,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: disCon,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                              ),
                              suffixIcon: const Icon(
                                Icons.percent,
                                color: Colors.orange,
                              )),
                          onChanged: (value) {
                            setState(() {
                              double disPercent = double.tryParse(disCon.text)!;
                              double discountrate =
                                  subTotal * (disPercent / 100);
                              disPriceCon.text = discountrate.toString();
                              double finalAmount = subTotal - discountrate;

                              totalAmountCon.text = finalAmount.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 90,
                        height: 40,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: disPriceCon,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              prefixIcon: const Icon(
                                Icons.currency_rupee,
                                color: Colors.black,
                              )),
                          onChanged: (value) {
                            setState(() {
                              double dis = double.tryParse(disPriceCon.text)! /
                                  subTotal *
                                  100;
                              disCon.text = dis.toString();
                              double total =
                                  subTotal - double.tryParse(disPriceCon.text)!;
                              totalAmountCon.text = total.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total Amount",
                      ),
                      const Spacer(),
                      Container(
                        width: 150,
                        child: TextFormField(
                          controller: totalAmountCon,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.currency_rupee),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "Save & New",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (globalKey.currentState!.validate()) {
                  Provider.of<CustomerModel>(context, listen: false)
                      .additemDetail(itemCon.text, subTotal.toString(),
                          disCon.text, disPriceCon.text, quantityCon.text,totalAmountCon.text,rateCon.text);
                           Provider.of<CustomerModel>(context, listen: false).addbilling(true);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const SaleScreen();
                    },
                  ));
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
