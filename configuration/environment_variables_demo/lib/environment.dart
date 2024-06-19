class Environment {
  const Environment._();

  static const name = String.fromEnvironment('name');
  static const serverUrl = String.fromEnvironment('server_url');
  static const apiKey = String.fromEnvironment('api_key');
  static const booleanValue = bool.fromEnvironment('a_boolean_value');
  static const numberValue = int.fromEnvironment('a_number_value');
  static const onlyDevValue = String.fromEnvironment(
    'only_dev_value',
    defaultValue: 'Not available in this environment',
  );
  static const onlyProdValue = String.fromEnvironment(
    'only_prod_value',
    defaultValue: 'Not available in this environment',
  );
}
