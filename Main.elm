module Main exposing (..)

import Data.Pet as Pet exposing (Pet)
import Html exposing (Html)
import Html.Events exposing (onClick)
import Http

-- Main entry point to the program
main =
    Html.program
        { init = init -- Function to call to initialize Model
        , update = update -- Function to call to handle messages
        , view = view -- Function to call with the model to facilitate rendering a view
        , subscriptions = subscriptions -- Some shenanigans that we don't need to talk about
        }



-- MODEL
type alias Model =
    { pets : List Pet
    }

-- The returned instance of the model here is the initial model used in the project
init : ( Model, Cmd Msg )
init =
    ( Model [Pet "Rufus" 10 Nothing]
    , Cmd.none
    )



-- UPDATE
-- Types of events that can occur in the application
type Msg
    = NoOp

-- A function to respond to these types of events
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW
-- A function to create an HTML representation of the application
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
