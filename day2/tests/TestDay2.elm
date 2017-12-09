module TestDay2 exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Day2 exposing (..)


part1 : Test
part1 =
    describe "Test case given in day 2 part 1"
    [ test "Given the following spreadsheet... In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18." <|
        \_ -> 
            """5 1 9 5
7 5 3
2 4 6 8"""
                |> day2part1
                |> Expect.equal 18

    ]
