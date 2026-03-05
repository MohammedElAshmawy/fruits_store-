import 'package:e_commerce/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings.dart';
import '../../../../../core/utils/text_Styles.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  bool isEditing = false;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: "شارع النيل مبني رقم 15");
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderSummaryWidget(),
          const SizedBox(height: 35),
          const Text(
            AppStrings.deliveryAddress,
            style: TextStyles.bold13,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: isEditing
                    ? TextField(
                        controller: addressController,
                        style: TextStyles.regular13,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                        ),
                      )
                    : Text(
                        addressController.text,
                        style: TextStyles.regular13,
                      ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isEditing ? Icons.check_circle_outline : Icons.edit_rounded,
                      size: 18,
                      color: isEditing ? Colors.green : const Color(0xFF4E5556),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isEditing ? 'حفظ' : 'تعديل',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: isEditing ? Colors.green : const Color(0xFF4E5556),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
