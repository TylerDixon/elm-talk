module Main exposing (..)

import Data.Pet as Pet exposing (Pet)
import Html exposing (Html)
import Html.Events exposing (onClick)
import Http

main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { pets : List Pet
    }


init : ( Model, Cmd Msg )
init =
    ( Model [Pet "Rufus" 10 Nothing]
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    Html.p []
        [ Html.h1 [] [ Html.text "Uber, but for Pets™:" ]
        , Html.section []
                [List.map
                    toString
                    model.pets |> String.join " " |> Html.text]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
