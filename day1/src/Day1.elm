module Day1 exposing (..)

import Char exposing (toCode)
import List exposing (..)


{- 
The captcha requires you to review a sequence of digits (your puzzle input) 
and find the sum of all digits that match the next digit in the list. 
The list is circular, so the digit after the last digit is the first digit 
in the list. 
-}
day1 : String -> Int
day1 x =
    recurse 
        ( x
            |> String.toList 
            |> listDigitsToListNumbers
            |> (\a -> append a (take 1 a)) -- circularity
        )
        0
        
recurse : List Int -> Int -> Int
recurse x summa =
    if head x == Nothing then -- termination case, we've run out of the list
        summa
    else if head x == head (tail x |> Maybe.withDefault []) then -- the current digit matches the next digit
        recurse (tail x |> Maybe.withDefault []) (summa + (head x |> Maybe.withDefault 0))
    else
        recurse (tail x |> Maybe.withDefault []) summa

{- Helper function that gives a list of Int from a list of Char [digits]. -}
asciiOffset = toCode '0'
listDigitsToListNumbers : List Char -> List Int
listDigitsToListNumbers listOfDigits =
    listOfDigits
        |> List.map toCode 
        |> List.map (\x -> x - asciiOffset)
        |> List.filter (\x -> 0 <= x && x <= 9) -- Silently dump invalid values. Whatever. This is an academic exercise.
