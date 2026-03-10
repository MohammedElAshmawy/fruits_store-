import 'dart:developer';

import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_input_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/payment_entities/payment_entity.dart';
import 'package:e_commerce/features/checkout/presentation/cubits/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(AutovalidateMode.disabled);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.hasClients) {
        setState(() {
          currentPage = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
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
              if (index > currentPage) {
                if (index > currentPage + 1) {
                  return;
                }
                if (currentPage == 0) {
                  if (context.read<OrderInputEntity>().payWithCash == null) {
                    showSnackBar(context, AppStrings.chooseWayToPay);
                    return;
                  }
                } else if (currentPage == 1) {
                  if (!formKey.currentState!.validate()) {
                    valueNotifier.value = AutovalidateMode.always;
                    return;
                  }
                  formKey.currentState!.save();
                }
              }
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
              valueListenable: valueNotifier,
              formKey: formKey,
              pageController: pageController,
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (currentPage == 0) {
                handleShippingSectionNavigation(context);
              } else if (currentPage == 1) {
                handleAddressNavigation();
              } else {
               paymentProcess(context);
              }
            },
            text: getButtonName(currentPage),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }

  void paymentProcess(BuildContext context) {
    var orderEntity= context.read<OrderInputEntity>();
     context.read<AddOrderCubit>().addOrder(entity: orderEntity);
     var paymentEntity=PaymentEntity.fromEntity(orderEntity);
     log(paymentEntity.toString());
     Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions:  [
          paymentEntity.toJson()
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          showSnackBar(context, "Payment Successful", isError: false);
        },
        onError: (error) {
          log(error.toString());
          showSnackBar(context, "Something went wrong, please try again");
          Navigator.pop(context);
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    ));
  }

  void handleAddressNavigation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }else{
      valueNotifier.value=AutovalidateMode.always;
    }
  }

  void handleShippingSectionNavigation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash == null) {
      showSnackBar(context, AppStrings.chooseWayToPay);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
