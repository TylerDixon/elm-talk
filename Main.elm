module Main exposing (..)

import Data.Pet as Pet exposing (Pet)
import Html exposing (Html)
import Html.Events exposing (onClick)
import Http
import Components.PetCard as PetCard exposing (view)

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
    , petsHidden : Bool
    }

-- The returned instance of the model here is the initial model used in the project
init : ( Model, Cmd Msg )
init =
    ( Model [] False
    , Pet.getAll PetLoaded
    )



-- UPDATE
-- Types of events that can occur in the application
type Msg
    = NoOp
    | HidePets
    | ShowPets
    | PetLoaded (Result Http.Error (List Pet))

-- A function to respond to these types of events
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
            
        PetLoaded result ->
            case result of
                Ok petList ->
                    { model | pets = petList } ! []

                Err err ->
                    model ! [] -- Don't do this, it makes you a bad person
                    -- I'm a bad person :(
        HidePets ->
            { model | petsHidden = True } ! []
        ShowPets ->
            { model | petsHidden = False } ! []



-- VIEW
-- A function to create an HTML representation of the application
view : Model -> Html Msg
view model =
    Html.p []
        [ Html.h1 [] [ Html.text "Uber, but for Pets™:" ]
        , if not model.petsHidden then
            Html.div [] [Html.button [ onClick HidePets ] [ Html.text "Hide Pets" ]
            , Html.section []
                (List.map
                    PetCard.view
                    model.pets
                )]
          else
            Html.button [ onClick ShowPets ] [ Html.text "Show Pets" ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
