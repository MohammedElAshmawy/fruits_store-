import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Form(
            autovalidateMode: value,
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<ShippingAddressEntity>().addressEntity.fullName =
                        value!;
                  },
                  hintText: AppStrings.fullName,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<ShippingAddressEntity>().addressEntity.email =
                        value!;
                  },
                  hintText: AppStrings.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<ShippingAddressEntity>().addressEntity.address =
                        value!;
                  },
                  hintText: AppStrings.address,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<ShippingAddressEntity>().addressEntity.city =
                        value!;
                  },
                  hintText: AppStrings.city,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<ShippingAddressEntity>().addressEntity.phone =
                        value!;
                  },
                  hintText: AppStrings.phone,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context
                            .read<ShippingAddressEntity>()
                            .addressEntity
                            .addressDetails =
                        value!;
                  },
                  hintText: AppStrings.flatNumber,
                  textInputType: TextInputType.number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
