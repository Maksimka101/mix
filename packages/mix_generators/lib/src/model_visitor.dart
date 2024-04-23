import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

// Step 1
class ModelVisitor extends SimpleElementVisitor<void> {
// Step 2
  String className = '';
  Map<String, dynamic> fields = {};
  Map<String, dynamic> constructorFields = {};

// Step 3
  @override
  void visitConstructorElement(ConstructorElement element) {
    final String returnType = element.returnType.toString();
    className = returnType.replaceAll("*", "");

    for (var parameter in element.parameters) {
      constructorFields[parameter.name] =
          parameter.type.toString().replaceAll("*", "");
    }
  }

// Step 4
  @override
  void visitFieldElement(FieldElement element) {
    /*
    {
      name: String,
      price: double
    }
     */
    String elementType = element.type.toString().replaceAll("*", "");
    fields[element.name] = elementType;
  }
}
