(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)
max = 100000
ExportValues[function_] := Module[{values},
  Print["  "<>ToString[function]];
  values = function[max];
  Export[ToString[function]<>".txt", values]
]

Abundant[n_] := Select[Range[n], DivisorSigma[1, #] > 2 # &]

functions = {
  Abundant
}

index = 0
numberOfFunctions = Length[functions]
ExportValuesWithProgress[function_] :=  Module[{},
  index++;
  Print["Start: "<>ToString[index]<>"/"<>ToString[numberOfFunctions]];
  ExportValues[function];
  Print["  Finished"];
]

Do[ExportValuesWithProgress[function], {function, functions}]
