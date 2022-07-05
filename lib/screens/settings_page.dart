// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/bitsave_user_request.dart';
// import 'package:six_cash/view/new_screens/wallet_tabs/funding_options/request_from_a_riend/friend_identity.dart';
// import 'package:six_cash/view/new_screens/wallet_tabs/funding_usd_wallet_page.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import 'alertPage.dart';
//
// bool _show = false;
//
// class LoanApplication extends StatefulWidget {
//   const LoanApplication({Key key}) : super(key: key);
//
//   @override
//   State<LoanApplication> createState() => _LoanApplicationState();
// }
//
// class _LoanApplicationState extends State<LoanApplication> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         BackGroundColr(
//           child: Container(
//             padding: EdgeInsets.only(left: 16, right: 16, top: 35),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BackButtons(),
//                 BoldTextTitle(
//                   data: 'Apply for a Loan',
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Text(
//                     'Taking out a loan means you can put your plans into action much earlier',
//                     style: TextStyle(
//                         color: Colors.grey, fontWeight: FontWeight.w300),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Cont32(
//                         title: 'Take a\nLoan',
//                         subtitle: 'Borrow money\nto meet your\nneeds',
//                         avatar: CircleAvatar(
//                           backgroundColor: Colors.pink,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 7),
//                     Expanded(
//                       child: Cont32(
//                         title: 'Your Loan\nHistory',
//                         subtitle: 'Monitor and know\nthe status of your\nloan today',
//                         avatar: CircleAvatar(
//                           backgroundColor: Colors.pink[200],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 80.0),
//                   child: Text(
//                     'Try our loan calculator to get estimates and secure the best option for your needs and wants',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     _bottomSheet();
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 20),
//                     height: 55,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 0.2, color: Colors.pink),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Center(
//                       child: Text(
//                         'Loan Calculator',
//                         style: TextStyle(
//                             color: Colors.pink, fontWeight: FontWeight.w400),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         _show == false ? Container() : AlertPage(),
//       ],
//     ));
//   }
//
//   Future<dynamic> _bottomSheet() {
//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//               color: Color(0xFF757575),
//               child: SingleChildScrollView(
//                 child: Container(
//                   height: 700,
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                           topLeft: Radius.circular(20))),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'Loan Calculator',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 23),
//                           ),
//                           Spacer(),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: CircleAvatar(
//
