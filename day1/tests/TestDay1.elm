module TestDay1 exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Day1 exposing (day1, day1part2)

part1 : Test
part1 =
    describe "Test cases given in day 1 part 1"
    [ test "1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit." <|
        \_ ->
            "1122"
                |> day1
                |> Expect.equal 3
    , test "1111 produces 4 because each digit (all 1) matches the next." <|
        \_ ->
            "1111"
                |> day1
                |> Expect.equal 4
    , test "1234 produces 0 because no digit matches the next." <|
        \_ ->
            "1234"
                |> day1
                |> Expect.equal 0
    , test "91212129 produces 9 because the only digit that matches the next one is the last digit, 9." <|
        \_ ->
            "91212129"
                |> day1 
                |> Expect.equal 9
    ]

part2 : Test
part2 =
    describe "Test cases given in day 1 part 2"
    [ test "1212 produces 6: the list contains 4 items, and all four digits match the digit 2 items ahead." <|
        \_ ->
            "1212"
                |> day1part2
                |> Expect.equal 6
    , test "1221 produces 0, because every comparison is between a 1 and a 2." <|
        \_ -> 
            "1221"
                |> day1part2
                |> Expect.equal 0
    , test "123425 produces 4, because both 2s match each other, but no other digit has a match." <|
        \_ -> 
            "123425"
                |> day1part2
                |> Expect.equal 4
    , test "123123 produces 12." <|
        \_ ->
            "123123"
                |> day1part2
                |> Expect.equal 12
    , test "12131415 produces 4." <|
        \_ -> 
            "12131415"
                |> day1part2
                |> Expect.equal 4
    ]