import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/helpers/plan_generator.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/run_type_week.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  final _formKey = GlobalKey<FormBuilderState>();
  final controller = Get.find<PlanController>();

  List<DropdownMenuItem<Object>> getRunTypes() {
    return RunType.values.map((RunType classType) {
      return DropdownMenuItem<RunType>(
          value: classType, child: Text(classType.value));
    }).toList();
  }

  List<DropdownMenuItem<Object>> getDistanceTypes() {
    return DistanceType.values.map((DistanceType classType) {
      return DropdownMenuItem<DistanceType>(
          value: classType, child: Text(classType.value));
    }).toList();
  }

  void submit() {
    if (_formKey.currentState?.saveAndValidate() != false) {
      print(_formKey.currentState?.value);
      controller.addPlan(generatePlan(
          _formKey.currentState?.value["RaceName"],
          _formKey.currentState?.value["StartDate"],
          _formKey.currentState?.value["RaceDate"],
          int.parse(_formKey.currentState?.value["StartMileage"]),
          int.parse(_formKey.currentState?.value["MaxMileage"]),
          int.parse(_formKey.currentState?.value["OffweekFrequency"]),
          _formKey.currentState?.value["Distance"],
          RunTypeWeek(
              monday: _formKey.currentState?.value["MondayRun"],
              tuesday: _formKey.currentState?.value["TuesdayRun"],
              wednesday: _formKey.currentState?.value["WednesdayRun"],
              thursday: _formKey.currentState?.value["ThursdayRun"],
              friday: _formKey.currentState?.value["FridayRun"],
              saturday: _formKey.currentState?.value["SaturdayRun"],
              sunday: _formKey.currentState?.value["SundayRun"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: "RaceName",
            validator: FormBuilderValidators.required(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Race name",
            ),
          ),
          Row(children: [
            Expanded(
                child: FormBuilderDateTimePicker(
                    name: "StartDate",
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Start date"))),
            Expanded(
                child: FormBuilderDateTimePicker(
                    name: "RaceDate",
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Race date"))),
          ]),
          Row(children: [
            Expanded(
                child: FormBuilderTextField(
                    name: "StartMileage",
                    validator: FormBuilderValidators.required(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Start mileage"))),
            Expanded(
                child: FormBuilderTextField(
                    name: "MaxMileage",
                    validator: FormBuilderValidators.required(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Max mileage"))),
          ]),
          Row(children: [
            Expanded(
                child: FormBuilderTextField(
                    name: "OffweekFrequency",
                    validator: FormBuilderValidators.required(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Offweek frequency"))),
            Expanded(
                child: FormBuilderDropdown(
              name: "Distance",
              validator: FormBuilderValidators.required(),
              items: getDistanceTypes(),
              hint: Text("Select a distance"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Distance"),
            )),
          ]),
          Divider(),
          Row(children: [
            Text("Monday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "MondayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Run type"),
            )),
          ]),
          Row(children: [
            Text("Tuesday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "TuesdayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(children: [
            Text("Wednesday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "WednesdayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(children: [
            Text("Thursday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "ThursdayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(children: [
            Text("Friday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "FridayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(children: [
            Text("Saturday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "SaturdayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(children: [
            Text("Sunday"),
            Expanded(
                child: FormBuilderDropdown(
              name: "SundayRun",
              validator: FormBuilderValidators.required(),
              items: getRunTypes(),
              hint: Text("Select a run type"),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Run type",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            )),
          ]),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: Text("Cancel")),
              OutlinedButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text("Create"))
            ],
          )
        ],
      ),
    );
  }
}
