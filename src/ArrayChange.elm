module Main exposing (..)

import Html exposing (div, text)


maxSafeInt =
    2 ^ 53 - 1


minSafeInt =
    maxSafeInt * -1


arrayChange : List Int -> Int
arrayChange input =
    let
        ( totalMoves, lastValue ) =
            List.foldl
                (\value ->
                    \( totalMoves, lastValue ) ->
                        case value > lastValue of
                            True ->
                                ( totalMoves, value )

                            False ->
                                let
                                    moves =
                                        lastValue - value + 1

                                    newTotalMoves =
                                        totalMoves + moves

                                    newLastValue =
                                        value + moves
                                in
                                    ( newTotalMoves, newLastValue )
                )
                ( 0, minSafeInt )
                input
    in
        totalMoves


testInput =
    [ 2, 3, 3, 5, 5, 5, 4, 12, 12, 10, 15 ]


result =
    arrayChange testInput


main : Html.Html msg
main =
    div []
        [ result |> toString |> text ]
