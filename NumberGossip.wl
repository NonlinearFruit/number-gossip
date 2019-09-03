#!/usr/bin/env wolframscript
(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)

Triangular[n_] := PolygonalNumber[3,n]
Square[n_] := PolygonalNumber[4,n]
Pentagonal[n_] := PolygonalNumber[5,n]
ColossallyAbundantNumber[n_] := {2, 6, 12, 60, 120, 360, 2520, 5040, 55440, 720720, 1441440}[[n]] (* OEIS A004490 *)
Perfect[n_] := PerfectNumber[n]
Lucas[n_] := LucasL[n]
PiPrime[n_] := {3, 31, 314159}[[n]] (* OEIS A005042 *)
ePrime[n_] := {2, 271, 2718281}[[n]] (* OEIS A007512 *)
PhiPrime[n_] := {1618033, 1618033988749}[[n]] (* OEIS A064117 *)
Even[n_] := n*2
Odd[n_] := n*2 - 1
PowerOf2[n_] := 2^n
PowerOf3[n_] := 3^n
PowerOf4[n_] := 4^n
PowerOf5[n_] := 5^n
PowerOf6[n_] := 6^n
PowerOf7[n_] := 7^n
PowerOf8[n_] := 8^n
PowerOf9[n_] := 9^n
Tetrahedral[n_] := Binomial[n+2, 3]
Cubic[n_] := n^3
Octohedral[n_] := 1/3 * n * (2 * n^2 + 1)

functions = {
  CatalanNumber,
  ColossallyAbundantNumber,
  Cubic,
  Even,
  Factorial,
  Fibonacci,
  Lucas,
  Octohedral,
  Odd,
  Pentagonal,
  Perfect,
  PhiPrime,
  PiPrime,
  PowerOf2,
  PowerOf3,
  PowerOf4,
  PowerOf5,
  PowerOf6,
  PowerOf7,
  PowerOf8,
  PowerOf9,
  Prime,
  Square,
  Tetrahedral,
  Triangular, 
  ePrime
}

max = 100000;
store = Association[{}];
Do[AppendTo[store, i -> ""], {i, max}];
CalculateValues[n_] := Module[{current, previouses, index},
  index = 1;
  previous = -1;
  current = n[index];
  While[current <= max,
    If[current != previous,
      AppendTo[store, current -> StringTrim[StringJoin[store[current]," " <> ToString[n]]]];
    ];
    index++;
    previous = current;
    current = n[index];
  ];
]

index = 0
numberOfFunctions = Length[functions]
CalculateValuesWithProgress[function_] :=  Module[{},
  index++;
  Print["Start: "<>ToString[index]<>"/"<>ToString[numberOfFunctions]];
  CalculateValues[function];
  Print["  Finished"];
]

Do[CalculateValuesWithProgress[function], {function, functions}]
file = OpenWrite["numbergossip.txt"];
Do[WriteLine[file, store[i]], {i, max}];
Close[file];
