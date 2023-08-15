#!/bin/bash

#Author: Elena Pashkova
#Description: Add and multiply functions


multiply()
{
  NUM_1=$1
  NUM_2=$2
  RESULT=$((NUM_1 * NUM_2))
  echo "The result of multiplication = $RESULT"
}


add()
{
  NUM_1=$1
  NUM_2=$2
  RESULT=$((NUM_1 + NUM_2))
  echo "The result of addition = $RESULT"
}


subtract()
{
  NUM_1=$1
  NUM_2=$2
  RESULT=$((NUM_1 - NUM_2))
  echo "The result of subtraction = $RESULT"
}



add $1 $2
multiply $1 $2

