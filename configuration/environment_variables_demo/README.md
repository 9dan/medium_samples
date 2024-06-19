# environment_variables_demo

Project used to provide working examples on how to use environment variables in Flutter.

[Medium Article](https://medium.com/@ninedan)

### Run using `--dart-define`:

#### Development
```bash
flutter run --dart-define name=DEV --dart-define server_url=https://mywonderfulserver.development.com --dart-define api_key=mydevelopmentapikey --dart-define boolean_value=true --dart-define number_value=42 --dart-define only_dev_value=development_only_value
```
#### Production
```bash
flutter run --dart-define name=PROD --dart-define server_url=https://mywonderfulserver.production.com --dart-define api_key=myproductionapikey --dart-define boolean_value=false --dart-define number_value=42 --dart-define only_prod_value=production_only_value
```
### Run using `--dart-define-from-file`:
#### Development
```bash
flutter run --dart-define-from-file=environment/development.json
```
#### Production
```bash
flutter run --dart-define-from-file=environment/production.json
```
