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

There are currently 31 properties that are populated and by default the script calculates only for 1 through 100k.

## Install

- Install [Wolfram Script][wolfram]
- Clone this repo
- [Bonus] Add number gossip [script][script] to your path (with proper path to database)

### Via Podman

Uses the [official Wolfram Engine image](https://hub.docker.com/r/wolframresearch/wolframengine).

#### Activate (one time)

The Wolfram Engine needs a [free developer license](https://www.wolfram.com/engine/). Store it in a named volume:

```
podman volume create wolfram-license

podman run --rm -it \
  -v wolfram-license:/home/wolframengine/.WolframEngine/Licensing \
  docker.io/wolframresearch/wolframengine
```

Enter your Wolfram ID and password at the prompt, then `Quit`.

#### Run

```
podman run --rm -it \
  --user=root \
  -v wolfram-license:/root/.WolframEngine/Licensing \
  -v .:/work \
  -w /work \
  docker.io/wolframresearch/wolframengine \
  wolframscript -file NumberGossip.wl
```

The output is `./numbergossip.txt`.

#### Clean Up

Remove the license volume (you will need to activate again next time):
```
podman volume rm wolfram-license
podman rmi docker.io/wolframresearch/wolframengine
```

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
