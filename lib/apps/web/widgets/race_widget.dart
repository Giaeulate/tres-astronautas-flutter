// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:vetweb/Entities/client/models/race_model.dart';
// import 'package:vetweb/global/environment.dart';

// class RaceWidget extends StatelessWidget {
//   final Function(RaceModel val) onChanged;
//   final RaceModel? model;
//   final double w;
//   const RaceWidget({
//     Key? key,
//     required this.onChanged,
//     this.model,
//     this.w = 350,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: w,
//       child: DropdownSearch<RaceModel>(
//         mode: Mode.MENU,
//         items: Environment.tempRaces,
//         itemAsString: (item) => item!.race,
//         onChanged: (val) => onChanged(val!),
//         showSearchBox: true,
//         dropdownSearchDecoration: const InputDecoration(hintText: 'Raza'),
//         selectedItem: model,
//       ),
//     );
//   }
// }
