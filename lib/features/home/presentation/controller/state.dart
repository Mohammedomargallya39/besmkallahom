import 'package:meta/meta.dart';

@immutable
abstract class HomeState{}

class Empty extends HomeState {}
class ChangeBottomNavBarState extends HomeState {}
class HideCardValueState extends HomeState {}
class AyahOnPressedValueState extends HomeState {}
class ChangeCurrentTasbeehNumber extends HomeState {}
class ChangeRepetitionNumber extends HomeState {}
class ResetCurrentTasbeehNumber extends HomeState {}
class GetTotalTasbeeh extends HomeState {}