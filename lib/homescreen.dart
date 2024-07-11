import 'package:flutter/material.dart';
import 'package:flutter_calculator/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TemperatureConverter _converter = TemperatureConverter();
  bool isDarkMode = false; // State variable to track dark mode

  //theme mode
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Apply the theme based on isDarkMode
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),

      child: Scaffold(
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.blue,
            title: Text('Temperature Converter',
                style:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.white)),
            actions: [
              // Theme Toggle
              IconButton(
                onPressed: toggleDarkMode,
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  // Dynamically set icon color based on theme
                  color: isDarkMode ? Colors.white : Colors.grey.shade800,
                  size: 30, // Or use a contrasting color for light mode
                ),
                tooltip: isDarkMode
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode', // Add tooltip
              ),
            ],
          ),
          body: MediaQuery.of(context).orientation == Orientation.portrait
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Initial Value Input

                      const SizedBox(height: 16.0),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButtons(
                            isSelected: [
                              _converter.selectedConversion ==
                                  'Fahrenheit to Celsius', // Use the initial value from your model
                              _converter.selectedConversion ==
                                  'Celsius to Fahrenheit', // Use the initial value from your model
                            ],
                            onPressed: (int index) {
                              setState(() {
                                _converter.setSelectedConversion(index);
                                // Update the model directly
                              });
                            },
                            borderRadius: BorderRadius.circular(25.0),
                            borderColor:
                                isDarkMode ? Colors.white : Colors.blue,
                            selectedBorderColor:
                                isDarkMode ? Colors.white : Colors.blue,
                            selectedColor:
                                isDarkMode ? Colors.white : Colors.white,
                            color: isDarkMode
                                ? Colors.black
                                : Colors.grey.shade400,
                            fillColor:
                                isDarkMode ? Colors.grey.shade600 : Colors.blue,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 55.0),
                                child: Text('F to C',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 55.0),
                                child: Text('C to F',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Converted Value Display
                      if (_converter.convertedValue != null)
                        SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width,

                          // child: Text(
                          //   'Converted: ${_converter.initialValue} = ${_converter.convertedValue!.toStringAsFixed(2)}',
                          //   // '${_converter.selectedConversion}: ${_converter.initialValue}  = ${_converter.convertedValue?.toStringAsFixed(2)}',
                          //   style: const TextStyle(fontSize: 20.0),
                          // ),
                          child: Container(
                            padding:
                                const EdgeInsets.only(right: 140.0, top: 15),
                            child: Text(
                              _converter.history.reversed.elementAt(0),
                              style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                      const SizedBox(height: 16.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter Temperature',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _converter.setInitialValue(
                                double.tryParse(value) ?? 0.00);
                          });
                        },
                      ),

                      const SizedBox(height: 16.0),

                      // Convert Button
                      ElevatedButton(
                        onPressed: _converter.initialValue != null
                            ? () {
                                _converter.convertTemperature();
                                setState(() {});
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDarkMode ? Colors.grey.shade600 : Colors.blue,
                          foregroundColor:
                              isDarkMode ? Colors.white : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: const Text('Convert',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      //History Display
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: _converter.history.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: ListTile(
                                title: Center(
                                    child: Text(_converter.history.reversed
                                        .elementAt(index))),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Initial Value Input

                      // const SizedBox(height: 16.0),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ToggleButtons(
                                isSelected: [
                                  _converter.selectedConversion ==
                                      'Fahrenheit to Celsius', // Use the initial value from your model
                                  _converter.selectedConversion ==
                                      'Celsius to Fahrenheit', // Use the initial value from your model
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    _converter.setSelectedConversion(index);
                                    // Update the model directly
                                  });
                                },
                                borderRadius: BorderRadius.circular(25.0),
                                borderColor:
                                    isDarkMode ? Colors.white : Colors.blue,
                                selectedBorderColor:
                                    isDarkMode ? Colors.white : Colors.blue,
                                selectedColor:
                                    isDarkMode ? Colors.white : Colors.white,
                                color: isDarkMode
                                    ? Colors.black
                                    : Colors.grey.shade400,
                                fillColor: isDarkMode
                                    ? Colors.grey.shade600
                                    : Colors.blue,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40.0),
                                    child: Text('F to C',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40.0),
                                    child: Text('C to F',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              // Converted Value Display
                              if (_converter.convertedValue != null)
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,

                                  // child: Text(
                                  //   'Converted: ${_converter.initialValue} = ${_converter.convertedValue!.toStringAsFixed(2)}',
                                  //   // '${_converter.selectedConversion}: ${_converter.initialValue}  = ${_converter.convertedValue?.toStringAsFixed(2)}',
                                  //   style: const TextStyle(fontSize: 20.0),
                                  // ),
                                  child: Text(
                                    _converter.history.reversed.elementAt(0),
                                    style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          // SizedBox(
                          //   width: 70,
                          // ),
                          //History Display
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 2,
                            child: ListView.builder(
                              itemCount: _converter.history.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: ListTile(
                                    title: Center(
                                        child: Text(_converter.history.reversed
                                            .elementAt(index))),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter Temperature',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _converter.setInitialValue(
                                double.tryParse(value) ?? 0.00);
                          });
                        },
                      ),

                      const SizedBox(height: 10.0),

                      // Convert Button
                      ElevatedButton(
                        onPressed: _converter.initialValue != null
                            ? () {
                                _converter.convertTemperature();
                                setState(() {});
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDarkMode ? Colors.grey.shade600 : Colors.blue,
                          foregroundColor:
                              isDarkMode ? Colors.white : Colors.white,
                        ),
                        child: const Text('Convert'),
                      ),
                      // const SizedBox(height: 16.0),
                    ],
                  ),
                )),
    );
  }
}
