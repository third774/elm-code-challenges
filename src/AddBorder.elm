module Main exposing (..)

import Html exposing (div, text, p)


-- For
-- picture = ["abc",
--            "ded"]
-- the output should be
-- addBorder(picture) = ["*****",
--                       "*abc*",
--                       "*ded*",
--                       "*****"]
-- [input] array.string picture
-- A non-empty array of non-empty equal-length strings.
-- Guaranteed constraints:
-- 1 ≤ picture.length ≤ 100,
-- 1 ≤ picture[i].length ≤ 100.
-- [output] array.string
-- The same matrix of characters, framed with a border of asterisks of width 1.


picture : List String
picture =
    [ "abcde"
    , "fghij"
    , "klmno"
    , "pqrst"
    , "uvwxy"
    ]


generateAsterisks : Int -> String
generateAsterisks n =
    (List.range 0 n) |> (List.map (\a -> "*")) |> String.join ""


mapToText : List String -> List (Html.Html msg)
mapToText =
    List.map (\a -> p [] [ text a ])


getNumberOfAsterisks : Maybe String -> Int
getNumberOfAsterisks s =
    case s of
        Nothing ->
            0

        Just s ->
            (String.length s) + 2


wrap : List String -> List String
wrap l =
    let
        wrappedRows =
            List.map (\a -> "*" ++ a ++ "*") l

        topAndBottomBars =
            (List.head l) |> getNumberOfAsterisks |> generateAsterisks
    in
        List.concat [ [ topAndBottomBars ], wrappedRows, [ topAndBottomBars ] ]


main : Html.Html msg
main =
    div []
        (picture |> wrap |> mapToText)
