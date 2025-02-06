import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/helpers/plan_generator.dart';
import 'package:run_planner/core/helpers/run_week_generator.dart';
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
  final controller = Get.find<PlanController>();

  final _formKey = GlobalKey<FormBuilderState>();

  List<DropdownMenuItem<Object>> getRunTypes() {
    return RunType.values
        .where((RunType classType) =>
            classType != RunType.race) // Filtering out RaceType.race
        .map((RunType classType) {
      return DropdownMenuItem<RunType>(
        value: classType,
        child: Text(classType.value),
      );
    }).toList();
  }

  List<DropdownMenuItem<Object>> getDistanceTypes() {
    return DistanceType.values.map((DistanceType classType) {
      return DropdownMenuItem<DistanceType>(
          value: classType, child: Text(classType.value));
    }).toList();
  }

  void createMock(Plan plan) {
    controller.addPlan(plan);
    Get.toNamed("/all");
  }

  void submit() {
    if (_formKey.currentState?.saveAndValidate() != false) {
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

      Get.toNamed("/all");
    }
  }

  @override
  Widget build(BuildContext context) {
    Plan mock = Plan(
        id: controller.getId(),
        name: "Paavo nurmi half marathon",
        startDate: DateTime(2025, 2, 1),
        raceDate: DateTime(2025, 5, 26),
        startMileage: 20,
        maxMileage: 35,
        offWeekFrequency: 5,
        distance: DistanceType.half,
        runWeeks: runWeekGenerator(
          DateTime(2025, 2, 1),
          DateTime(2025, 5, 26),
          RunTypeWeek(
              monday: RunType.fast,
              tuesday: RunType.slow,
              wednesday: RunType.none,
              thursday: RunType.long,
              friday: RunType.slow,
              saturday: RunType.gym,
              sunday: RunType.none),
          5,
          20,
          35,
        ));

    return Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create a new plan",
              style: Theme.of(context).textTheme.headlineLarge),
          Card.outlined(
              child: ListTile(
                  title: Text("Don't know what you are doing?"),
                  subtitle:
                      Text("Click this to create a predetermined project!"),
                  trailing: Icon(Icons.add),
                  onTap: () {
                    createMock(mock);
                  })),
          FormBuilder(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.only(bottom: 30, top: 5),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilderTextField(
                      name: "RaceName",
                      validator: FormBuilderValidators.required(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Race name",
                      ),
                    ),
                    Row(spacing: 10, children: [
                      Expanded(
                          child: FormBuilderDateTimePicker(
                              name: "StartDate",
                              firstDate: DateTime.now(),
                              validator: FormBuilderValidators.required(),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Start date"))),
                      Expanded(
                          child: FormBuilderDateTimePicker(
                              name: "RaceDate",
                              firstDate: DateTime.now(),
                              validator: (value) {
                                if (value == null) {
                                  return "This field cannot be empty";
                                }
                                final startDate = _formKey
                                    .currentState?.fields['StartDate']?.value;
                                if (startDate != null &&
                                    value.isBefore(startDate)) {
                                  return "Race date cannot be before the start date";
                                }

                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Race date"))),
                      Expanded(
                          child: FormBuilderDropdown(
                        name: "Distance",
                        validator: FormBuilderValidators.required(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        items: getDistanceTypes(),
                        hint: Text("Select a distance"),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Distance"),
                      )),
                    ]),
                    Row(spacing: 10, children: [
                      Expanded(
                          child: FormBuilderTextField(
                              name: "StartMileage",
                              validator: FormBuilderValidators.required(),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              validator: (value) {
                                if (value == null) {
                                  return "This field cannot be empty";
                                }
                                final startMileage = _formKey.currentState
                                    ?.fields['StartMileage']?.value;

                                if (startMileage != null &&
                                    startMileage != "" &&
                                    value != "" &&
                                    int.parse(startMileage) >
                                        int.parse(value)) {
                                  return "Max mileage cannot be less than start mileage";
                                }

                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Max mileage"))),
                      Expanded(
                          child: FormBuilderTextField(
                              name: "OffweekFrequency",
                              validator: FormBuilderValidators.required(),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Offweek frequency"))),
                    ]),
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Select a type of run for each day",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                          "It is highly recommened to have only 1 fast and 1 long day. Having more long runs with low mileage might glitch the alogithm",
                          style: Theme.of(context).textTheme.bodySmall)
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Monday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "MondayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type"),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Tuesday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "TuesdayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Wednesday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "WednesdayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Thursday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "ThursdayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Friday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "FridayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Saturday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "SaturdayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(children: [
                      Expanded(flex: 3, child: Text("Sunday")),
                      Expanded(
                          flex: 7,
                          child: FormBuilderDropdown(
                            name: "SundayRun",
                            validator: FormBuilderValidators.required(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            items: getRunTypes(),
                            hint: Text("Select a run type"),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Run type",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto),
                          )),
                    ]),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Cancel")),
                        OutlinedButton(
                            onPressed: () {
                              submit();
                            },
                            child: Text("Create"))
                      ],
                    )
                  ],
                )),
          )
        ]);
  }
}
