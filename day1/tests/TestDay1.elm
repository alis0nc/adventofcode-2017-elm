module TestDay1 exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Day1 exposing (day1)

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