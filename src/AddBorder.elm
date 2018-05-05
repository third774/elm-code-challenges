module Main exposing (..)

import Html exposing (div, text, p)


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
    (List.range 0 n) |> (List.map (\_ -> "*")) |> String.join ""


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
            l |> List.head |> getNumberOfAsterisks |> generateAsterisks
    in
        List.concat [ [ topAndBottomBars ], wrappedRows, [ topAndBottomBars ] ]


main : Html.Html msg
main =
    div []
        (picture |> wrap |> mapToText)
