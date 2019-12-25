# Number Gossip

This project generates a number property database. For example, 1 is:

 - CatalanNumber 
 - Cubic 
 - Factorial 
 - Fibonacci 
 - Lucas 
 - Octohedral 
 - Odd 
 - Pentagonal 
 - Square 
 - Tetrahedral 
 - Triangular

The resulting database is in the form of a text file. Where line #1 has a space separated list of properties for the number 1. Here is an example for the numbers 1 through 10:

```
CatalanNumber Cubic Factorial Fibonacci Lucas Octohedral Odd Pentagonal Square Tetrahedral Triangular
CatalanNumber ColossallyAbundantNumber Even Factorial Fibonacci PowerOf2 Prime ePrime
Fibonacci Lucas Odd PiPrime PowerOf3 Prime Triangular
Even Lucas PowerOf2 PowerOf4 Square Tetrahedral
CatalanNumber Fibonacci Odd Pentagonal PowerOf5 Prime
ColossallyAbundantNumber Even Factorial Octohedral Perfect PowerOf6 Triangular
Lucas Odd PowerOf7 Prime
Cubic Even Fibonacci PowerOf2 PowerOf8
Odd PowerOf3 PowerOf9 Square
Even Tetrahedral Triangular
```

There are currently 26 properties that are populated and by default the script calculates only for 1 through 100k.

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
