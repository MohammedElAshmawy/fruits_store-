part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}
final class ProductAdded extends CartState {}
final class ProductRemoved extends CartState {}
