
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vyapar_app/CustomerModel.dart';
import 'package:vyapar_app/SaleScree.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool toggle = true;
  @override
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 204, 217, 240),
     body: SingleChildScrollView(
        child: Column(children: [
          Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
              color: Colors.white,
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Xianinfotech",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications_outlined,
                        color: Colors.black, size: 25),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          toggle = !toggle;
                        });
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: toggle
                                  ? const Color.fromARGB(255, 223, 169, 166)
                                  : null,
                              border: Border.all(
                                  color: toggle ? Colors.red : Colors.black)),
                          child: Text(
                            "Transaction Details",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: toggle ? Colors.red : Colors.black),
                          ))),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        toggle = !toggle;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: toggle
                              ? null
                              : const Color.fromARGB(255, 223, 169, 166),
                          border: Border.all(
                              color: toggle ? Colors.black : Colors.red)),
                      child: Text(
                        "Party Details",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: toggle ? Colors.black : Colors.red),
                      ),
                    ),
                  ),
                ]),
              ])),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Quick Links",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const Positioned(
                                        top: -15,
                                        child: Icon(Icons.bookmark_add_outlined,
                                            size: 30),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Add Txn",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const Positioned(
                                        top: -15,
                                        child: Icon(Icons.description_outlined,
                                            size: 30),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Sale Report",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const Positioned(
                                        top: -15,
                                        child: Icon(Icons.settings_outlined,
                                            size: 30),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Txn Settings",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      Positioned(
                                        top: -15,
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Show All",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('customerData').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error fetching data'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No customer data available'));
              }

           
              var customerList = snapshot.data!.docs.map((doc) {
                return doc.data() as Map<String, dynamic>;
              }).toList();

              return ListView.builder(
                shrinkWrap: true,
                itemCount: customerList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Customer name
                                Text(customerList[index]['name'] ?? "null"),
                                const Spacer(),
                                // List number
                                Text("# ${index + 1}"),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.greenAccent,
                                  ),
                                  child: const Text(
                                    'Sale',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                // Date
                                Text(customerList[index]['date'] ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text("Total"),
                                    // Total amount
                                    Text("₹ ${customerList[index]['amount']}"),
                                  ],
                                ),
                                const SizedBox(width: 80),
                                 Column(
                                  children: [
                                    const Text("Balance"),
                                    // Total balance
                                    Text("₹ ${customerList[index]['balance']}"),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.print),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
    
        ]
        )
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: GestureDetector(
      onTap: () {
         Provider.of<CustomerModel>(context, listen: false).addbilling(false);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SaleScreen();
        }));
      },
      child: Container(
        height: 55,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(Icons.currency_rupee_sharp, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text(
                "Add new Sale",
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.blue,
      selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_sharp),
          label: 'DASHBOARD',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_outlined),
          label: 'ITEMS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'MENU',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium),
          label: 'GET PREMIUM',
        ),
      ],
    ),
  );
}

}
    
