import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../domain/entities/order_address_entity.dart';
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
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          customAppbar(title: getAppBarTitle(currentPage)),
          const SizedBox(height: 20),
          StepItemList(
            currentPageIndex: currentPage,
            onStepTapped: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          const SizedBox(height: 32),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (context.read<OrderAddressEntity>().payCash == null) {
                showSnackBar(context, AppStrings.chooseWayToPay);
                return;
              }
              if (currentPage < 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // Final step action
              }
            },
            text: getButtonName(currentPage),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }

  String getButtonName(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
      case 1:
        return AppStrings.next;
      case 2:
        return AppStrings.payWithPaypal;
      default:
        return AppStrings.next;
    }
  }

  String getAppBarTitle(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return AppStrings.shipping;
      case 1:
        return AppStrings.address;
      case 2:
        return AppStrings.payment;
      default:
        return AppStrings.shipping;
    }
  }
}
