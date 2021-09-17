readme="README.md"
database="numbergossip.txt"
properties=$(tr ' ' '\n' < numbergossip.txt | sort | uniq | wc -l | xargs -I% expr % - 1)

cat > $readme << END
# Number Gossip

This project generates a number property database. For example, 1 is:

$(cat $database | head -1 | tr ' ' '\n' | sed 's/^/ - /g')

The resulting database is in the form of a text file. Where line #1 has a space separated list of properties for the number 1. Here is an example for the numbers 1 through 10:

\`\`\`
$(cat $database | head -10)
\`\`\`

There are currently $properties properties that are populated and by default the script calculates only for 1 through 100k.

## Install

- Install [Wolfram Script][wolfram]
- Clone this repo
- [Bonus] Add number gossip [script][script] to your path (with proper path to database)

## Generate the Database

To run the script and generate the output file, try:

\`\`\`
wolframscript NumberGossip.wl
\`\`\`

## Using the Database

To actually lookup a number's properties, there is a short little [script][script] which is called like so:

\`\`\`
number-gossip 10
\`\`\`

[script]: https://github.com/NonlinearFruit/dotfiles/blob/master/scripts/number-gossip
[wolfram]: https://www.wolfram.com/wolframscript/?source=nav
END
