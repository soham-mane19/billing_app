import 'package:flutter/material.dart';

class CustomerModel extends ChangeNotifier {
  List<Map<String, dynamic>> customers = [];
  String? itemName;
  String? itemSubtotal;
  String? disPer;
  String? disPrice;
  String? totalQun;
  String? totalAmount;
  String? rate;
  
  bool _isbilling = false; // Private variable for billing visibility

  List<Map<String, dynamic>> getcustomers() {
    return customers;
  }

  void toggleBilling() {
    _isbilling = !_isbilling; // Toggle billing visibility
    notifyListeners(); // Notify listeners of the change
  }

  bool get isbilling => _isbilling; // Getter for billing visibility

  void addbilling(bool showbilling) {
    _isbilling = showbilling; // If needed, you can keep this method too
    notifyListeners();
  }

  void additemDetail(String itemName, String itemSubtotal, String disPer, String disPrice, String totalQun, String totalAmount, String rate) {
    this.itemSubtotal = itemSubtotal.isNotEmpty ? itemSubtotal : '0.0';
    this.disPer = disPer.isNotEmpty ? disPer : '0.0';
    this.totalQun = totalQun.isNotEmpty ? totalQun : '0';
    this.disPrice = disPrice.isNotEmpty ? disPrice : '0.0';
    this.itemName = itemName.isNotEmpty ? itemName : 'Unnamed Item';
    this.totalAmount = totalAmount.isNotEmpty ? totalAmount : '0.0';
    this.rate = rate.isNotEmpty ? rate : '0.0';

    notifyListeners();
  }

  void addCustomer(Map<String, dynamic> customer) {
    customers.add(customer);
    notifyListeners();
  }
}
