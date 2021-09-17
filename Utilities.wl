#!/usr/bin/env wolframscript

index = 0
numberOfFunctions = Length[bulkFunctions]
ExportValues[function_] := Module[{values},
  Print["  "<>ToString[function]];
  values = function[max];
  Export[ToString[function]<>".txt", values]
]
ExportValuesWithProgress[function_] :=  Module[{},
  index++;
  Print["Start: "<>ToString[index]<>"/"<>ToString[numberOfFunctions]];
  ExportValues[function];
  Print["  Finished"];
]

