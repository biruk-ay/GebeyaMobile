import 'package:gebeya/common/forms/email_field.dart';
import 'package:gebeya/common/forms/field.dart';
import 'package:gebeya/common/forms/form.dart';

class LoginForm extends Form {
  final email = EmailField();
  final password = TextField();

  @override
  List<Field> getFields() {
    return [email, password];
  }
}
