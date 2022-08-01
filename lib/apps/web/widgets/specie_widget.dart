// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:vetweb/Entities/client/models/specie_model.dart';
// import 'package:vetweb/global/environment.dart';

// class SpecieWidget extends StatelessWidget {
//   final Function(SpecieModel val) onChanged;
//   final SpecieModel? model;
//   final double w;
//   const SpecieWidget({
//     Key? key,
//     required this.onChanged,
//     this.model,
//     this.w = 350,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: w,
//       child: DropdownSearch<SpecieModel>(
//         mode: Mode.MENU,
//         items: Environment.tempSpecies,
//         itemAsString: (item) => item!.specie,
//         onChanged: (val) => onChanged(val!),
//         showSearchBox: true,
//         dropdownSearchDecoration: const InputDecoration(hintText: 'Especie'),
//         selectedItem: model,
//       ),
//     );
//   }
// }
