import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item_list.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          customAppbar(title: AppStrings.shipping),
          const SizedBox(height: 20),
          const StepItemList(),
          const SizedBox(height: 32),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
            ),
          ),
          SizedBox(height: 16,),
          CustomButton(onPressed: (){
            pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }, text: AppStrings.next),
          SizedBox(height: 25,)
        ],
      ),
    );
  }
}
