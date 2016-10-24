module Main exposing (..)

import Html exposing (text)
import List.Extra exposing (elemIndex)


evenCollatzNumber : Int -> Int
evenCollatzNumber n =
    n // 2


oddCollatzNumber : Int -> Int
oddCollatzNumber n =
    (3 * n) + 1


calculateSequence : Int -> Int
calculateSequence n =
    calculateSequence' 1 n


calculateSequence' : Int -> Int -> Int
calculateSequence' sequenceLength n =
    if n == 1 then
        sequenceLength
    else if n % 2 == 0 then
        calculateSequence' (sequenceLength + 1) <| evenCollatzNumber n
    else
        calculateSequence' (sequenceLength + 1) <| oddCollatzNumber n


calculateLongestSequence : List Int -> Int
calculateLongestSequence numberRange =
    let
        sequenceLengths =
            List.map calculateSequence numberRange
    in
        List.Extra.elemIndex
            (Maybe.withDefault 0 (List.maximum sequenceLengths))
            sequenceLengths
            |> Maybe.withDefault 0
            |> (+) 1


main : Html.Html a
main =
    text <| toString (calculateLongestSequence [1..100000])
