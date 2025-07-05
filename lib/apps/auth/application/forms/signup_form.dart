import 'package:gebeya/common/forms/email_field.dart';
import 'package:gebeya/common/forms/field.dart';
import 'package:gebeya/common/forms/form.dart';

class SignupForm extends Form {
  final name = TextField();
  final email = EmailField();
  final password = TextField();

  @override
  List<Field> getFields() {
    return [name, email, password];
  }
}
