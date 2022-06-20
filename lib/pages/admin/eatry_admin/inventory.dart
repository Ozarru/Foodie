// import 'package:flutter/material.dart';
// import 'package:rx_manager/models/models.dart';
// import 'package:rx_manager/utils/mock_poducts.dart';
// import 'package:rx_manager/widgets/tables/product_table.dart';
// import 'package:tabler_icons/tabler_icons.dart';

// import '../../utils/utils.dart';
// import '../../widgets/widgets.dart';

// class Inventory extends StatefulWidget {
//   const Inventory({Key? key}) : super(key: key);

//   @override
//   _InventoryState createState() => _InventoryState();
// }

// class _InventoryState extends State<Inventory> {
//   String query = '';
//   bool isLoading = true;
//   List<MockProduct> products = testProducts;

//   void searchDataset(String query) {
//     query = query.toLowerCase();
//     final products = testProducts.where((product) {
//       final prodLabel = product.label.toLowerCase();
//       final prodSku = product.sku.toString();
//       final input = query;

//       return prodLabel.contains(input) || prodSku.contains(input);
//     }).toList();

//     setState(() {
//       this.products = products;
//       this.query = query;
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Inventory',
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               buildSearch(),
//               const SizedBox(height: 10),
//               Expanded(child: ProdsTable())
//             ]),
//       ),
//     );
//   }

//   Widget buildSearch() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8),
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10), color: Colors.white),
//         child: Row(
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
//               child: Icon(TablerIcons.search, color: Colors.grey, size: 16),
//             ),
//             Expanded(
//                 child: SearchField(
//               text: query,
//               hint: 'Find a product',
//               onChanged: searchDataset,
//             )),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildProduct(products) {
//     if (Responsive.isMobile(context)) {
//       return InventoryGrid(products: products, gridCount: 2);
//     } else if (Responsive.isTablet(context)) {
//       return InventoryGrid(products: products, gridCount: 3);
//     } else if (Responsive.isDesktop(context)) {
//       return InventoryGrid(products: products, gridCount: 5);
//     } else if (Responsive.isWideDesktop(context)) {
//       return InventoryGrid(products: products, gridCount: 7);
//     } else {
//       return InventoryGrid(products: products, gridCount: 10);
//     }
//   }
// }
