import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vyapar_app/AdditemScreen.dart';
import 'package:vyapar_app/CustomerModel.dart';
import 'package:vyapar_app/HomeScreen.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isrecived = false;
  double? dueBalance;
  final TextEditingController recivedController = TextEditingController();


  DateTime selectedDate = DateTime.now();
  bool iscredit = true;

  @override
void initState() {
  super.initState();

  // Delay accessing the Provider until the first frame is built
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final customerModel = Provider.of<CustomerModel>(context, listen: false);
    
    if (customerModel.isbilling) {
      // Initialize amountController when isbilling is true
      final totalAmount = customerModel.totalAmount;
      setState(() {
        amountController.text = totalAmount!;
      });
    }
  });
}

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void saveData() async {
    Map<String, dynamic> customerData = {
      'date': '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
      'name': customerNameController.text,
      'phoneNo': phoneNumberController.text,
      'amount': amountController.text,
      'balance': dueBalance,
      'itemName': Provider.of<CustomerModel>(context, listen: false).itemName,
    };

    await FirebaseFirestore.instance
        .collection('customerData')
        .add(customerData);

    setState(() {
      Provider.of<CustomerModel>(context, listen: false)
          .addCustomer(customerData);
    });

    customerNameController.clear();
    phoneNumberController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> customerList =
        Provider.of<CustomerModel>(context).getcustomers();
         
        final customerModel = Provider.of<CustomerModel>(context);
    print("customer list hi aahe :$customerList");
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
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
                        "Sale",
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 193, 192, 192)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  iscredit = !iscredit;
                                });
                              },
                              child: Container(
                                height: 34,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: iscredit ? Colors.green : null,
                                ),
                                child: const Text("Credit"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  iscredit = !iscredit;
                                });
                              },
                              child: Container(
                                height: 34,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: iscredit ? null : Colors.green),
                                child: const Text("Sale"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Invoice No.",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w300),
                          ),
                          Row(
                            children: [
                              //list number
                              Text('${customerList.length + 1}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                              const Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w300),
                          ),
                          Row(
                            children: [
                              //Date
                              Text(
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300)),
                              IconButton(
                                  onPressed: () {
                                    selectDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    size: 35,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                TextFormField(
                  controller: customerNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                    labelText: 'Customer Name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const AdditemScreen();
                      },
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Add Items",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "(Optional)",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 
            10,
          ),
          
          Container(
            alignment: Alignment.center,
            height: 20,
            width: double.infinity,
            color: Colors.blue,
            child: Row(
              children: [
             GestureDetector(
              onTap: () {
                setState(() {
                   
 customerModel.toggleBilling(); 
            print("Billing visibility toggled to ${customerModel.isbilling}");
                
                  
                });
               
              },
              child:const  Icon(Icons.arrow_drop_down,color: Colors.white,)),
                const SizedBox(
                  width: 20,
                ),
                 const Text("Billing",style: TextStyle(color: Colors.black),)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          customerModel.isbilling?
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                     
                      Text(
                        "${Provider.of<CustomerModel>(context).itemName?? ""}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${Provider.of<CustomerModel>(context).totalAmount ?? ""}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Item Subtotal",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                       const Spacer(),
                       Text(
                        "${(Provider.of<CustomerModel>(context).totalQun ??"")} x ${(Provider.of<CustomerModel>(context).itemSubtotal ??"") } = ",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                     
                      Text(
                        "${(double.tryParse(Provider.of<CustomerModel>(context).totalQun ?? '0') ?? 0) * (double.tryParse(Provider.of<CustomerModel>(context).itemSubtotal ?? '0') ?? 0)}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Discount(%): ${Provider.of<CustomerModel>(context).disPer ?? "0"}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange),
                      ),
                      const Spacer(),
                    Text(
  double.tryParse(Provider.of<CustomerModel>(context).disPrice ?? "0")!
      .toStringAsFixed(2),
  style: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.orange,
  ),
),
                    ],
                  ),
                   Row(
                    children: [
                     const  Text(
                        "Total Quantity",
                        style:  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      const Spacer(),
                     Text(
                        Provider.of<CustomerModel>(context).totalQun ??"1",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ):Container(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Row(
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  child: TextFormField(
                    controller: amountController,
                     
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee, size: 20),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Row(
              children: [
                Checkbox(
                    value: isrecived,
                    onChanged: (value) {
                      setState(() {
                        isrecived = !isrecived;
                      });
                      if (isrecived) {
                        setState(() {
                          recivedController.text = amountController.text;
                        });
                      } else {
                        recivedController.clear();
                        dueBalance = double.tryParse(amountController.text);
                        setState(() {});
                      }
                    }),
                const Text(
                  "Recived",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  child: TextFormField(
                    controller: recivedController,
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee, size: 20),
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
                    onChanged: (value) {
                      double totalAmount =
                          double.tryParse(amountController.text)!;
                      double totalrecived =
                          double.tryParse(recivedController.text)!;
                      dueBalance = totalAmount - totalrecived;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Row(
              children: [
                const Text(
                  "Balance Due",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 130,
                ),
                const Icon(
                  Icons.currency_rupee,
                  size: 18,
                ),
                const Spacer(),
                Text("${dueBalance ?? 0.0}",
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ],
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
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(8),
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
                saveData();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 60,
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.blue,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
