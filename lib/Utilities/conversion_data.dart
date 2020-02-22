List<String> lengthUnits = ["metre","kilometre","centimetre","feet","inch","yard","mile"];
List<String> massUnits = ["kilogram","gram","ton","pound"];
List<String> temperatureUnits = ["celcius", "fahrenheit", "kelvin"];

List<String> getList(String type){
  if(type == "Length")
    return lengthUnits;
  else if(type == "Mass")
    return massUnits;
  else
    return temperatureUnits;
}

var conversionFactors = {
  "kilometre" : 1000,
  "metre" : 1,
  "centimetre" : 0.01,
  "millimetre" : 0.001,
  "mile" : 1609.344,
  "yard" : 0.9144,
  "feet" : 0.3048,
  "inch" : 0.0254,

  "kilogram" : 1,
  "gram" : 0.001,
  "ton" : 1000,
  "pound" : 0.45359237,

};

String convert(String type, String srcUnit, String destUnit, String inputValue){

if(type == "Temperature"){

    double value = double.parse(inputValue);
    if(srcUnit == "fahrenheit")
      value = (value - 32) / 1.8;
    else if(srcUnit == "kelvin")
      value = value - 273.15;
    if(destUnit == "kelvin")
      value = value + 273.15;
    else if(destUnit == "fahrenheit")
      value = value * 1.8 + 32;
    return value.toStringAsFixed(6);
  }
  else{
    double value = double.parse(inputValue);
    value = value * conversionFactors[srcUnit] * (1 / conversionFactors[destUnit]);
    if(value == 0)
      return "0";
    if(value < 1e-5)
      return value.toStringAsExponential(6);
    else
      return value.toStringAsFixed(6);
  }
}