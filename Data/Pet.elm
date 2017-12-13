module Data.Pet exposing (Pet, Msg, getAll)

import Http
import Json.Decode exposing (Decoder, field, list, map3, maybe, string, int)

type alias Pet =
    { name : String
    , availableIn : Int
    , picture : Maybe String
    }


type Msg
    = Loaded (Result Http.Error (List Pet))

-- Make request for pets
getAll msg =
    Http.send msg (Http.get "http://www.localhost.com:6767" decodePetsResponse)

-- Decode response for pets
decodePetsResponse : Decoder (List Pet)
decodePetsResponse =
    list
        (map3 Pet
            (field "name" string)
            (field "availableIn" int)
            (maybe (field "picture" string))
        )

