(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)
max = 100;
CalculateValues[n_] := Module[{current, previouses, index},
  index = 1;
  current = n[index];
  previouses = List[];
  While[current <= max,
    AppendTo[previouses, current];
    index++;
    current = n[index];
  ];
  previouses
]

ExportValues[function_] := Module[{values},
  values = CalculateValues[function];
  Print["  "<>ToString[function]];
  Export[ToString[function]<>".txt", values]
]

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
  Fibonacci, 
  Perfect, 
  Triangular, 
  Square, 
  Pentagonal, 
  ColossallyAbundantNumber, 
  Lucas,
  PiPrime,
  PhiPrime,
  ePrime,
  Even,
  Odd,
  PowerOf2,
  PowerOf3,
  PowerOf4,
  PowerOf5,
  PowerOf6,
  PowerOf7,
  PowerOf8,
  PowerOf9,
  Factorial,
  Tetrahedral,
  Cubic,
  Octohedral
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
