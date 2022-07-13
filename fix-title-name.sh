#!/bin/bash -x
#test="What Difference Does It Make? (Peel Session - BBC;"
test="Loving Wings (Live"
fixTitle()
{
  fixme=$1
  local n=''
  for w in $(echo $fixme | cut -f 1-8 -d ' ')
  do 
    nw=$(echo -n $w  | tr -dC [:alnum:])
    #skip the first word
    if [ $(echo -n $n|wc -c) -ne 0 ] 
    then 
      n="$n-$nw" 
    else
      n=$nw
    fi
  done
  echo $n
}

new_title=$(fixTitle "$test")

echo new title: $new_title
