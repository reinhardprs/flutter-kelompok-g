import 'cost_model.dart';

class TypeModel {
  final String? name;
  late double? maxAmount;
  final List<CostModel>? expenses;

  TypeModel({this.name, this.maxAmount, this.expenses});
}
