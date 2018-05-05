module Main exposing (..)

import Html exposing (div, text)


twoListsToTupleList : List a -> List b -> List ( a, b )
twoListsToTupleList a b =
    List.map2 (\a -> \b -> ( a, b )) a b


swappedAreEqual : ( a, b ) -> ( b, a ) -> Bool
swappedAreEqual ( w, x ) ( y, z ) =
    ( w, x ) == ( z, y )


notEqualTuple : ( a, a ) -> Bool
notEqualTuple ( x, y ) =
    x /= y


areSimilar : List Int -> List Int -> Bool
areSimilar x y =
    case (twoListsToTupleList x y) |> (List.filter notEqualTuple) of
        [] ->
            True

        [ first, second ] ->
            swappedAreEqual first second

        _ ->
            False


a =
    -- [ 832, 998, 148, 570, 533, 561, 894, 147, 455, 279 ]
    [ 1, 2, 3 ]


b =
    -- [ 832, 570, 148, 998, 533, 561, 455, 147, 894, 279 ]
    -- [ 1, 2, 3 ]
    [ 3, 2, 1 ]


test =
    areSimilar a b


main : Html.Html msg
main =
    div []
        [ test |> toString |> text ]
