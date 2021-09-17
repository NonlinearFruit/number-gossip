#!/usr/bin/env wolframscript
(* http://mathworld.wolfram.com/topics/SpecialNumbers.html *)
max = 100000;

Triangular[n_] := PolygonalNumber[3,n]
Square[n_] := PolygonalNumber[4,n]
Pentagonal[n_] := PolygonalNumber[5,n]
ColossallyAbundant[n_] := {2, 6, 12, 60, 120, 360, 2520, 5040, 55440, 720720, 1441440}[[n]] (* OEIS A004490 *)
Perfect[n_] := PerfectNumber[n]
Lucas[n_] := LucasL[n]
PiPrime[n_] := {3, 31, 314159}[[n]] (* OEIS A005042 *)
ePrime[n_] := {2, 271, 2718281}[[n]] (* OEIS A007512 *)
PhiPrime[n_] := {1618033, 1618033988749}[[n]] (* OEIS A064117 *)
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
LazyCaterer[n_] := PolygonalNumber[3,n] + 1 (* OEIS A000124 *)
Cake[n_] := Binomial[n, 3] + Binomial[n, 2] + Binomial[n, 1] + Binomial[n, 0] (* OEIS A000125 *)
MagicSquare[n_] := n * (n^2 + 1)/2 (* OEIS A006003 *)

generatingFunctions = {
  Cake,
  CatalanNumber,
  ColossallyAbundant,
  Cubic,
  Factorial,
  Fibonacci,
  LazyCaterer,
  Lucas,
  MagicSquare,
  Octohedral,
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

AbundantValues = Select[Range[max], DivisorSigma[1, #] > 2 # &]
Abundant[n_] := If[ n <= Length[AbundantValues], AbundantValues[[n]], max+1 ] (* OEIS A005101 *)

DeficientValues = Select[Range[max], DivisorSigma[1, # ] < 2*# &]
Deficient[n_] := If[ n <= Length[DeficientValues], DeficientValues[[n]], max+1 ] (* OEIS A005100 *)

PracticalQ[n_] := Module[{f, p, e, prod=1, ok=True}, If[n<1 || (n>1 && OddQ[n]), False, If[n==1, True, f=FactorInteger[n]; {p, e} = Transpose[f]; Do[If[p[[i]] > 1+DivisorSigma[1, prod], ok=False; Break[]]; prod=prod*p[[i]]^e[[i]], {i, Length[p]}]; ok]]]; (* T. D. Noe, Apr 02 2010 *)
PracticalValues = Select[Range[max], PracticalQ[#] &]
Practical[n_] := If[ n <= Length[PracticalValues], PracticalValues[[n]], max+1 ] (* OEIS A005153 *)

BusyBeaverValues = {1, 6, 21, 107}
BusyBeaver[n_] := If[ n <= Length[BusyBeaverValues], BusyBeaverValues[[n]], max+1 ] (* OEIS A060843 *)

PalindromeValues = Select[Range[max], PalindromeQ[#] &]
Palindrome[n_] := If[ n <= Length[PalindromeValues], PalindromeValues[[n]], max+1 ]

bulkFunctions = {
  Abundant,
  BusyBeaver,
  Deficient,
  Palindrome,
  Practical
}
Do[AppendTo[generatingFunctions, bulkFunction], {bulkFunction, bulkFunctions}];

store = Association[{}];
Do[AppendTo[store, i -> ""], {i, max}];
CalculateValues[generatingFunction_] := Module[{current, previouses, index},
  index = 1;
  previous = -1;
  current = generatingFunction[index];
  While[current <= max,
    If[current != previous,
      AppendTo[store, current -> StringTrim[StringJoin[store[current]," " <> ToString[generatingFunction]]]];
    ];
    index++;
    previous = current;
    current = generatingFunction[index];
  ];
]

index = 0
numberOfFunctions = Length[generatingFunctions]
CalculateValuesWithProgress[generatingFunction_] :=  Module[{},
  index++;
  Print["Start: "<>ToString[index]<>"/"<>ToString[numberOfFunctions]<>" :: "<>ToString[generatingFunction]];
  CalculateValues[generatingFunction];
  Print["  Finished"];
]

Do[CalculateValuesWithProgress[generatingFunction], {generatingFunction, generatingFunctions}]
file = OpenWrite["numbergossip.txt"];
Do[WriteLine[file, store[i]], {i, max}];
Close[file];
