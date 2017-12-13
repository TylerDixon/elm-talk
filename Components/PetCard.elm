module Components.PetCard exposing (view)

import Data.Pet as Pet exposing (Pet)
import Html exposing (Html)
import Html.Attributes exposing (class, src)


view pet =
    Html.div [ class "pet-card" ]
        [ case pet.picture of
            Just picture ->
                Html.img [ src picture ] []

            Nothing ->
                Html.p [] [ Html.text "NO PICTURE GIVEN" ]
        , Html.p [] [Html.text pet.name]
        , Html.p [] [ "At your doorstep in: " ++ toString pet.availableIn ++ " Minutes" |> Html.text ]
        ]
