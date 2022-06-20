// import 'package:flutter/material.dart';
// import 'package:tabler_icons/tabler_icons.dart';
// import '../../utils/utils.dart';
// import '../../widgets/widgets.dart';

// class AddFood extends StatelessWidget {
//   const AddFood({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const CustomAppBar(),
//         // drawer: const CustomDrawer(),
//         body: MouseRegion(child: buildResponsivePage(context)));
//   }

//   Widget buildResponsivePage(context) {
//     if (Responsive.isMobile(context)) {
//       return Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: const Expanded(child: FoodForm()),
//       );
//     } else if (Responsive.isTablet(context)) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: Row(children: const [
//           Expanded(
//             flex: 3,
//             child: FoodForm(),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: FileHandler(),
//             ),
//           )
//         ]),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Row(children: const [
//           Expanded(
//             flex: 3,
//             child: FoodForm(),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.0),
//               child: FileHandler(),
//             ),
//           )
//         ]),
//       );
//     }
//   }
// }
