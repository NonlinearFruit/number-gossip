#!/usr/bin/env wolframscript
(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)

Abundant[n_] := Select[Range[n], DivisorSigma[1, #] > 2 # &] (* OEIS A005101 *)
Deficient[n_] := Select[Range[n], DivisorSigma[1, # ] < 2*# &] (* OEIS A005100 *)
PracticalQ[n_] := Module[{f, p, e, prod=1, ok=True}, If[n<1 || (n>1 && OddQ[n]), False, If[n==1, True, f=FactorInteger[n]; {p, e} = Transpose[f]; Do[If[p[[i]] > 1+DivisorSigma[1, prod], ok=False; Break[]]; prod=prod*p[[i]]^e[[i]], {i, Length[p]}]; ok]]]; (* T. D. Noe, Apr 02 2010 *)
Practical[n_] := Select[Range[n], PracticalQ[#] &] (* OEIS A005153 *)

functions = {
  Abundant,
  Deficient,
  Practical
}

max = 100000
index = 0
numberOfFunctions = Length[functions]
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

Do[ExportValuesWithProgress[function], {function, functions}]
