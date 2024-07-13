// // ignore_for_file: must_be_immutable
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ecommerce/src/components.dart';
// import 'package:ecommerce/src/config.dart';
// import 'package:ecommerce/src/providers.dart';
// import 'package:ecommerce/src/utils.dart';
// import 'package:ecommerce/src/screens.dart';
//
// class ListingsGridItem extends ConsumerWidget {
//   ListingsGridItem({
//     super.key,
//     required this.imageText,
//     required this.price,
//     required this.nameOfHouse,
//     required this.houseAddress,
//     this.width,
//     required this.isAvailable,
//     required this.userId,
//     required this.listingId,
//     required this.listingType,
//     required this.propertyType,
//     required this.isVerified,
//     required this.bedNumber,
//     required this.bathNumber,
//     this.loveIconOnTap,
//     this.showVerificationTag = true,
//     required this.role,
//     required this.isAPropertyListing,
//     this.canTap = true,
//   });
//
//   final String imageText;
//   final String price;
//   final String nameOfHouse;
//   final String houseAddress;
//   final String bathNumber;
//   final String bedNumber;
//   final double? width;
//   final bool isAvailable;
//   final num? isVerified;
//   final String listingId;
//   final String userId;
//   final String listingType;
//   final String propertyType;
//   final bool? showVerificationTag;
//   final int role;
//   final bool isAPropertyListing;
//   final bool canTap;
//   VoidCallback? loveIconOnTap;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var themeMode = ref.watch(themeViewModel).themeMode;
//     var theme = Theme.of(context);
//     var profileProvider = ref.watch(profileViewModel);
//     return Padding(
//       padding: EdgeInsets.only(bottom: 15.h, right: 6.w, left: 6.w),
//       child: GestureDetector(
//         onTap: () {
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 1, color: AppColors.kGrey300),
//             borderRadius: BorderRadius.circular(10.r)
//           ),
//           height: 268.h,
//           width: width ?? double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),
//                       topRight:  Radius.circular(10.r),),
//                     color: AppColors.kGrey300,
//                   ),
//
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),
//                           topRight:  Radius.circular(10.r),),
//                         child: CachedNetworkImage(
//                           // height: height,
//                           width: 360.w,
//                           imageUrl: imageText,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional.topStart,
//                         child: SizedBox(
//                           // width: 136.w,
//                           height: 34.h,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 4.w, top: 5.h),
//                             child: InkWell(
//                               // onTap: rentSaleOnTap,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 4.w),
//                                 height: 24.h,
//                                 width: 56.w,
//                                 decoration: BoxDecoration(
//                                   color: themeMode == ThemeMode.light
//                                       ? listingType == "rent"
//                                           ? AppColors.kFadedBlue
//                                           : listingType == "lease"
//                                               ? AppColors.kFadedBlue
//                                               : AppColors.kYellowDeep
//                                       :
//                                       //Dark Mode
//                                       listingType == "rent"
//                                           ? AppColors.kBlue300
//                                           : listingType == "lease"
//                                               ? AppColors.kBlue300
//                                               : AppColors.kYellowDeep,
//                                   borderRadius: BorderRadius.circular(5.r),
//                                 ),
//                                 child: Center(
//                                   child: TextView(
//                                     text: UtilFunctions.capitalizeAllWord(listingType),
//                                     color: themeMode == ThemeMode.light
//                                         ? AppColors.kWhite
//                                         : AppColors.kBlack8,
//                                     fontSize: 12.spMin,
//                                     fontWeight: FontWeight.w500,
//                                     fontFamily: ttHoves,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               //
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 5.w,
//                     vertical: 5.h,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox( height: 20.h,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextView(
//                               text:
//                               '${UtilFunctions.capitalizeAllWord(nameOfHouse)} ',
//                               fontSize: 13.spMin,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: ttHoves,
//                             ),
//                             isVerified! > 0
//                                 ? isAPropertyListing
//                                 ? Row(
//                               children: List.generate(
//                                 3,
//                                 ((index) => TextView(
//                                   text: "\u2022",
//                                   fontSize: 18.spMin,
//                                   color: themeMode == ThemeMode.dark
//                                       ? AppColors.kPrimary150
//                                       : AppColors.kCoolGray,
//                                 )),
//                               ),
//                             )
//                                 : Container(
//                              // padding: EdgeInsets.all(4.spMin),
//                               width: 55,
//                               decoration: BoxDecoration(
//                                 color:
//                                 theme.scaffoldBackgroundColor,
//                                 borderRadius:
//                                 BorderRadius.circular(20.r),
//                                 border: Border.all(
//                                   color:
//                                   themeMode == ThemeMode.light
//                                       ? AppColors.kTextBlack
//                                       : AppColors.kPrimary1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(1.0),
//                                 child: Center(
//                                   child: TextView(
//                                     text: enquire,
//                                     fontSize: 11.spMin,
//                                     fontFamily: ttHoves, color: AppColors.kTextBlack,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             )
//                                 : const SizedBox.shrink()
//                           ],
//                         ),
//                       ),
//                       SizedBox( height: 20.h,
//                         child: TextView(
//                           text: houseAddress,
//                           fontSize: 12.spMin,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.kGrey,
//                           fontFamily: ttHoves,
//                         ),
//                       ),
//
//                       SizedBox(  height: 20.h,
//                         child: TextView(
//                           text: UtilFunctions.capitalizeAllWord(propertyType.replaceAll('_', ' ')),
//                           fontSize: 12.spMin,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.kTextBlack,
//                           fontFamily: ttHoves,
//                         ),
//                       ),
//
//                       Container(  height: 20.h,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 5.w,
//                         ),
//                         // height: 20.h,
//                         width: 65.w,
//                         decoration: BoxDecoration(
//                           color:  isVerified! >0
//                               ? themeMode == ThemeMode.light
//                                   ? AppColors.kGreenLight
//                                   : AppColors.kGreenTrans
//                               : AppColors.kErrorPrimary.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(
//                             16.r,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             isVerified! >0
//                                 ? Icon(
//                                     Icons.verified,
//                                     color: AppColors.kGreen,
//                                     size: 10.spMin,
//                                   )
//                                 : const SizedBox.shrink(),
//                             TextView(
//                               text: isVerified! >0? verified : unVerified,
//                               color:  isVerified! >0
//                                   ? AppColors.kGreen
//                                   : AppColors.kErrorPrimary,
//                               fontSize: 10.spMin,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: ttHoves,
//                             )
//                           ],
//                         ),
//                       ),
//
//                       // : const SizedBox.shrink(),
//                       //
//                       // TextView(
//                       //   text: isVerified! > 0
//                       //       ? nameOfHouse
//                       //       : "$bedNumber Bedroom",
//                       //   fontSize:  isVerified! >0 ? 9.spMin : 15.spMin,
//                       //   fontWeight:
//                       //   isVerified! >0 ? FontWeight.w400 : FontWeight.w500,
//                       //   fontFamily: ttHoves,
//                       //   color:  isVerified! >0
//                       //       ? AppColors.kSubText
//                       //       : theme.colorScheme.primary,
//                       // ),
//                       SizedBox(  height: 20.h,
//                         child: TextView(
//                           text:
//                           "${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(double.parse(price.toString()))}",
//                           fontSize: 13.spMin,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: ttHoves,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BedBathNumberButton extends ConsumerWidget {
//   const BedBathNumberButton({
//     super.key,
//     required this.bedNumber,
//     required this.bathNumber,
//   });
//
//   final String bedNumber;
//   final String bathNumber;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var themeMode = ref.watch(themeViewModel).themeMode;
//     Theme.of(context);
//     return RichText(
//       text: TextSpan(
//         text: bedNumber,
//         style: TextStyle(
//           fontSize: 12.spMin,
//           fontWeight: FontWeight.w600,
//           fontFamily: ttHoves,
//           color: themeMode == ThemeMode.light
//               ? AppColors.kTextBlack
//               : AppColors.kTextWhite,
//         ),
//         children: [
//           TextSpan(
//             text: " Bed  ",
//             style: TextStyle(
//               fontSize: 12.spMin,
//               fontWeight: FontWeight.w400,
//               fontFamily: ttHoves,
//               color: themeMode == ThemeMode.light
//                   ? AppColors.kTextBlack
//                   : AppColors.kTextWhite,
//             ),
//           ),
//           TextSpan(
//             text: bathNumber,
//             style: TextStyle(
//               fontSize: 13.spMin,
//               fontWeight: FontWeight.w600,
//               fontFamily: ttHoves,
//               color: themeMode == ThemeMode.light
//                   ? AppColors.kTextBlack
//                   : AppColors.kTextWhite,
//             ),
//           ),
//           TextSpan(
//             text: " Bath",
//             style: TextStyle(
//               fontSize: 13.spMin,
//               fontWeight: FontWeight.w400,
//               fontFamily: ttHoves,
//               color: themeMode == ThemeMode.light
//                   ? AppColors.kTextBlack
//                   : AppColors.kTextWhite,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // class RentButton extends StatelessWidget {
// //   const RentButton({
// //     super.key,
// //     required this.text,
// //     required this.buttonColor,
// //     required this.rentSaleOnTap,
// //   });
// //   final String text;
// //   final Color buttonColor;
// //   final VoidCallback rentSaleOnTap;
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: rentSaleOnTap,
// //       child: Container(
// //         height: 24.h,
// //         width: 56.w,
// //         decoration: BoxDecoration(
// //           color: buttonColor,
// //           borderRadius: BorderRadius.circular(5.r),
// //         ),
// //         child: Center(
// //           child: TextView(
// //             text: text,
// //             color: AppColors.kWhite,
// //             fontSize: 12.spMin,
// //             fontWeight: FontWeight.w500,
// //             fontFamily: ttHoves,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class ListingsConfirmGridItem extends ConsumerWidget {
//   ListingsConfirmGridItem(
//       {super.key,
//       required this.imageText,
//       required this.price,
//       required this.bathRoomNo,
//       required this.bedRoomNo,
//       this.rentOrSaleButton,
//       required this.verificationStatusColor,
//       required this.nameOfHouse,
//       required this.houseAddress,
//       required this.availableOrNot,
//       required this.availableOrNotButtonColor,
//       required this.availableOrNotTextColor,
//       required this.isVerified,
//
//
//       required this.role,
//       this.loveIconOnTap,
//       this.showVerificationTag = true});
//
//   final String imageText;
//   final String price;
//   final int role;
//   final Color verificationStatusColor;
//   final String nameOfHouse;
//   final String houseAddress;
//   Widget? rentOrSaleButton;
//   final String availableOrNot;
//   final Color availableOrNotTextColor;
//   final Color availableOrNotButtonColor;
//   final int bedRoomNo;
//   final int bathRoomNo;
//
//   final num? isVerified;
//   final bool? showVerificationTag;
//
//   VoidCallback? loveIconOnTap;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // var listingProvider = ref.watch(listingViewModel);
//     var themeMode = ref.watch(themeViewModel).themeMode;
//     Theme.of(context);
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: AppColors.kGrey300),
//           borderRadius: BorderRadius.circular(10.r)
//       ),
//       height: 250.h,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 5.0.w,
//                 vertical: 5.h,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),
//                   topRight:  Radius.circular(10.r),),
//                 color: AppColors.kTransparent,
//                 image: listingProvider.propertyImageList.isNotEmpty
//                     ? DecorationImage(
//                         fit: BoxFit.cover,
//                         image: FileImage(listingProvider.propertyImageList[0]!))
//                     : const DecorationImage(
//                         fit: BoxFit.cover, image: NetworkImage("url")),
//               ),
//               child: Align(
//                 alignment: AlignmentDirectional.topCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 136.w,
//                       height: 34.h,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           //Available button.
//                           //set some properties as variables.
//                           Container(
//                             height: 24.h,
//                             width: 70.w,
//                             decoration: BoxDecoration(
//                               color: availableOrNotButtonColor,
//                               borderRadius: BorderRadius.circular(
//                                 5.r,
//                               ),
//                             ),
//                             child: Center(
//                               child: TextView(
//                                 text: availableOrNot,
//                                 color: availableOrNotTextColor,
//                                 fontSize: 10.spMin,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: ttHoves,
//                               ),
//                             ),
//                           ),
//                           //Rent button
//                           // rentOrSaleButton!
//                         ],
//                       ),
//                     ),
//                     //Love Icon
//                     // InkWell(
//                     //   onTap: loveIconOnTap,
//                     //   child: CircleAvatar(
//                     //     backgroundColor: AppColors.kWhite,
//                     //     radius: 16.r,
//                     //     child: Center(
//                     //       child: Icon(
//                     //         Icons.favorite_border_outlined,
//                     //         color: AppColors.kPrimary1,
//                     //         size: 19.5.spMin,
//                     //       ),
//                     //     ),
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           //
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 5.w,
//                 vertical: 5.h,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox( height: 20.h,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextView(
//                           text:
//                           '${UtilFunctions.capitalizeAllWord(nameOfHouse)} ',
//                           fontSize: 13.spMin,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: ttHoves,
//                         ),
//                         isVerified! > 0
//                             ? Row(
//                           children: List.generate(
//                             3,
//                             ((index) => TextView(
//                               text: "\u2022",
//                               fontSize: 18.spMin,
//                               color: themeMode == ThemeMode.dark
//                                   ? AppColors.kPrimary150
//                                   : AppColors.kCoolGray,
//                             )),
//                           ),
//                         )
//                             : const SizedBox.shrink()
//                       ],
//                     ),
//                   ),
//                   TextView(
//                     text: houseAddress,
//                     fontSize: 12.spMin,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.kGrey,
//                     fontFamily: ttHoves,
//                   ),
//
//                   TextView(
//                     text: UtilFunctions.capitalizeAllWord(propertyType.replaceAll('_', ' ')),
//                     fontSize: 12.spMin,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.kTextBlack,
//                     fontFamily: ttHoves,
//                   ),
//
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 5.w,
//                     ),
//                     // height: 20.h,
//                     width: 65.w,
//                     decoration: BoxDecoration(
//                       color:  isVerified! >0
//                           ? themeMode == ThemeMode.light
//                           ? AppColors.kGreenLight
//                           : AppColors.kGreenTrans
//                           : AppColors.kErrorPrimary.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(
//                         16.r,
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         isVerified! >0
//                             ? Icon(
//                           Icons.verified,
//                           color: AppColors.kGreen,
//                           size: 10.spMin,
//                         )
//                             : const SizedBox.shrink(),
//                         TextView(
//                           text: isVerified! >0? verified : unVerified,
//                           color:  isVerified! >0
//                               ? AppColors.kGreen
//                               : AppColors.kErrorPrimary,
//                           fontSize: 10.spMin,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: ttHoves,
//                         )
//                       ],
//                     ),
//                   ),
//
//                   // : const SizedBox.shrink(),
//                   //
//                   // TextView(
//                   //   text: isVerified! > 0
//                   //       ? nameOfHouse
//                   //       : "$bedNumber Bedroom",
//                   //   fontSize:  isVerified! >0 ? 9.spMin : 15.spMin,
//                   //   fontWeight:
//                   //   isVerified! >0 ? FontWeight.w400 : FontWeight.w500,
//                   //   fontFamily: ttHoves,
//                   //   color:  isVerified! >0
//                   //       ? AppColors.kSubText
//                   //       : theme.colorScheme.primary,
//                   // ),
//                   TextView(
//                     text:
//                     "${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(double.parse(price.toString()))}",
//                     fontSize: 13.spMin,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: ttHoves,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// //Love Icon
// // InkWell(
// //   onTap: loveIconOnTap,
// //   child: CircleAvatar(
// //     backgroundColor: AppColors.kWhite,
// //     radius: 16.r,
// //     child: Center(
// //       child: Icon(
// //         Icons.favorite_border_outlined,
// //         color: AppColors.kPrimary1,
// //         size: 19.5.spMin,
// //       ),
// //     ),
// //   ),
// // )
