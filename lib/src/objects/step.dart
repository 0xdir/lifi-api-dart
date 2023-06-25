import 'action.dart';
import 'estimate.dart';

/// The step within a route
///
/// A route can have one or mode steps.
class Step {
  final String id;
  final String type;
  final String tool;
  final Action action;
  final Estimate estimate;
  final String integrator;

  Step({
    required this.id,
    required this.type,
    required this.tool,
    required this.action,
    required this.estimate,
    required this.integrator,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      id: json['id'],
      type: json['type'],
      tool: json['tool'],
      action: Action.fromJson(json['action']),
      estimate: Estimate.fromJson(json['estimate']),
      integrator: json['integrator'],
    );
  }
}
