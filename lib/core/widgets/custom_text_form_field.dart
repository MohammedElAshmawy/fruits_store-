import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.textEditingController
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  final TextEditingController? textEditingController;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved,
      validator:(value){
        if(value!.isEmpty||value.length<4){
          return "حدث خطأ ما؛ من فضلك حاول مره اخري";
        }
        return null;
      } ,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        helperStyle: TextStyles.bold13.copyWith(
          color: AppColors.hintTextFormFieldColor,
          fontWeight: FontWeight.w700
        ),
        filled: true,
        fillColor: AppColors.fillFormFieldColor,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder()
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.borderColor
        )
      );
  }
}


class CustomTextFormFieldForPassword extends StatefulWidget {
  const CustomTextFormFieldForPassword({super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,

  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextFormFieldForPassword> createState() => _CustomTextFormFieldForPasswordState();
}

class _CustomTextFormFieldForPasswordState extends State<CustomTextFormFieldForPassword> {
  bool isObscure=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      onSaved:widget.onSaved,
      validator:(value){
        if(value!.isEmpty||value.length<4){
          return "حدث خطأ م؛ من فضلك حاول مره اخري";
        }
        return null;
      } ,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: (){
                isObscure=!isObscure;
                setState(() {
                });
              },
              child: widget.suffixIcon),
          hintText: widget.hintText,
          helperStyle: TextStyles.bold13.copyWith(
              color: AppColors.hintTextFormFieldColor,
              fontWeight: FontWeight.w700
          ),
          filled: true,
          fillColor: AppColors.fillFormFieldColor,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
            width: 1,
            color: AppColors.borderColor
        )
    );
  }
}









