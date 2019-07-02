(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)
max = 100000
ExportValues[function_] := Module[{values},
  Print["  "<>ToString[function]];
  values = function[max];
  Export[ToString[function]<>".txt", values]
]

Abundant[n_] := Select[Range[n], DivisorSigma[1, #] > 2 # &] (* A005101 *)
Deficient[n_] := Select[Range[n], DivisorSigma[1, # ] < 2*# &] (* A005100 *)

functions = {
  Abundant,
  Deficient
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
