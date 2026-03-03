import 'package:e_commerce/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          CustomTextFormField(
            hintText: AppStrings.fullName,
            textInputType: TextInputType.text,),
          SizedBox(height: 10,),
          CustomTextFormField(
            hintText: AppStrings.email,
            textInputType: TextInputType.emailAddress,),
          SizedBox(height: 10,),
          CustomTextFormField(
            hintText: AppStrings.address,
            textInputType: TextInputType.text,),
          SizedBox(height: 10,),
          CustomTextFormField(
            hintText: AppStrings.city,
            textInputType: TextInputType.text,),
          SizedBox(height: 10,),
          CustomTextFormField(
            hintText: AppStrings.phone,
            textInputType: TextInputType.phone,),
          SizedBox(height: 10,),
          CustomTextFormField(
            hintText: AppStrings.flatNumber,
            textInputType: TextInputType.number,),
        ],
      ),
    );
  }
}