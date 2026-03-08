import 'package:e_commerce/core/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../domain/entities/order_input_entity.dart';

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
                    context.read<OrderInputEntity>().shippingAddressEntity.name =
                        value!;
                  },
                  hintText: AppStrings.fullName,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.email =
                        value!;
                  },
                  hintText: AppStrings.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.address =
                        value!;
                  },
                  hintText: AppStrings.address,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.city =
                        value!;
                  },
                  hintText: AppStrings.city,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.phone =
                        value!;
                  },
                  hintText: AppStrings.phone,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.floor =
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
