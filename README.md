# Number Gossip

This project generates a number property database. For example, 1 is:

 - CatalanNumber
 - Cubic
 - Factorial
 - Fibonacci
 - Lucas
 - MagicSquare
 - Octohedral
 - Pentagonal
 - Square
 - Tetrahedral
 - Triangular
 - BusyBeaver
 - Deficient
 - Palindrome
 - Practical

The resulting database is in the form of a text file. Where line #1 has a space separated list of properties for the number 1. Here is an example for the numbers 1 through 10:

```
CatalanNumber Cubic Factorial Fibonacci Lucas MagicSquare Octohedral Pentagonal Square Tetrahedral Triangular BusyBeaver Deficient Palindrome Practical
Cake CatalanNumber ColossallyAbundant Factorial Fibonacci LazyCaterer PowerOf2 Prime ePrime Deficient Palindrome Practical
Fibonacci Lucas PiPrime PowerOf3 Prime Triangular Deficient Palindrome
Cake LazyCaterer Lucas PowerOf2 PowerOf4 Square Tetrahedral Deficient Palindrome Practical
CatalanNumber Fibonacci MagicSquare Pentagonal PowerOf5 Prime Deficient Palindrome
ColossallyAbundant Factorial Octohedral Perfect PowerOf6 Triangular BusyBeaver Palindrome Practical
LazyCaterer Lucas PowerOf7 Prime Deficient Palindrome
Cake Cubic Fibonacci PowerOf2 PowerOf8 Deficient Palindrome Practical
PowerOf3 PowerOf9 Square Deficient Palindrome
Tetrahedral Triangular Deficient
```

There are currently 30 properties that are populated and by default the script calculates only for 1 through 100k.

## Install

- Install [Wolfram Script][wolfram]
- Clone this repo
- [Bonus] Add number gossip [script][script] to your path (with proper path to database)

## Generate the Database

To run the script and generate the output file, try:

```
wolframscript NumberGossip.wl
```

## Using the Database

To actually lookup a number's properties, there is a short little [script][script] which is called like so:

```
number-gossip 10
```

[script]: https://github.com/NonlinearFruit/dotfiles/blob/master/scripts/number-gossip
[wolfram]: https://www.wolfram.com/wolframscript/?source=nav
