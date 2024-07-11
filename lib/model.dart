class TemperatureConverter {
  double? _initialValue;
  double? _convertedValue;
  String _selectedConversion =
      'Fahrenheit to Celsius'; // Default to Fahrenheit to Celsius
  final List<String> history = [];

  double? get initialValue => _initialValue;
  double? get convertedValue => _convertedValue;
  String get selectedConversion => _selectedConversion;

  // Set the initial value
  void setInitialValue(double? value) {
    _initialValue = value;
  }

  // Set the selected conversion (using an index)
  void setSelectedConversion(int index) {
    _selectedConversion =
        index == 0 ? 'Fahrenheit to Celsius' : 'Celsius to Fahrenheit';
  }

  // Convert the temperature
  void convertTemperature() {
    if (_initialValue != null) {
      if (_selectedConversion == 'Fahrenheit to Celsius') {
        _convertedValue = (_initialValue! - 32) * 5 / 9;
      } else if (_selectedConversion == 'Celsius to Fahrenheit') {
        _convertedValue = (_initialValue! * 9 / 5) + 32;
      }
      history.add(
          // 'Converted ${_initialValue} ${_selectedConversion} to ${_convertedValue}');
          '${_selectedConversion}: ${_initialValue}  = ${_convertedValue?.toStringAsFixed(2)}');
    }
  }
}
