import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import 'testing_utils.dart';

testOverrideModifiersOrder(
  WidgetTester tester, {
  required Widget Function(Style, List<Type>) widgetBuilder,
}) async {
  final style = Style(
    const VisibilityModifierAttribute(true),
    const OpacityModifierAttribute(1),
    const TransformModifierAttribute(),
    const AspectRatioModifierAttribute(2),
    const ClipOvalModifierAttribute(),
    const PaddingModifierAttribute(EdgeInsetsDirectionalDto(top: 10)),
  );
  const orderOfModifiersOnlySpecs = [
    ClipOvalModifierSpec,
    AspectRatioModifierSpec,
    TransformModifierSpec,
    OpacityModifierSpec,
    VisibilityModifierSpec,
  ];

  // JUST SPECS
  await verifyDescendants(
    widgetBuilder(style, orderOfModifiersOnlySpecs),
    style,
    orderOfModifiersOnlySpecs,
    tester,
  );

  // SPECS + ATTRIBUTES
  const orderOfModifiersSpecsAndAttributes = [
    ClipOvalModifierSpec,
    AspectRatioModifierAttribute,
    TransformModifierAttribute,
    OpacityModifierSpec,
    VisibilityModifierAttribute,
  ];
  await verifyDescendants(
    widgetBuilder(style, orderOfModifiersSpecsAndAttributes),
    style,
    orderOfModifiersSpecsAndAttributes,
    tester,
  );

  // JUST ATTRIBUTES
  const orderOfModifiersOnlyAttributes = [
    ClipOvalModifierAttribute,
    AspectRatioModifierAttribute,
    TransformModifierAttribute,
    OpacityModifierAttribute,
    VisibilityModifierAttribute,
  ];

  await verifyDescendants(
    widgetBuilder(style, orderOfModifiersOnlyAttributes),
    style,
    orderOfModifiersOnlyAttributes,
    tester,
  );
}

Future<void> verifyDescendants(
  Widget widget,
  Style style,
  List<Type> orderOfModifiers,
  WidgetTester tester,
) async {
  await tester.pumpMaterialApp(
    widget,
  );

  expect(find.byType(widget.runtimeType), findsOneWidget);

  expect(
    find.descendant(
      of: find.byType(widget.runtimeType),
      matching: find.byType(ClipOval),
    ),
    findsOneWidget,
  );

  expect(
    find.descendant(
      of: find.byType(ClipOval),
      matching: find.byType(AspectRatio),
    ),
    findsOneWidget,
  );

  expect(
    find.descendant(
      of: find.byType(AspectRatio),
      matching: find.byType(Transform),
    ),
    findsOneWidget,
  );

  expect(
    find.descendant(
      of: find.byType(Transform),
      matching: find.byType(Opacity),
    ),
    findsOneWidget,
  );

  expect(
    find.descendant(
      of: find.byType(Opacity),
      matching: find.byType(Padding),
    ),
    findsOneWidget,
  );
}