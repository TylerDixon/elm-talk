module Data.Pet exposing (Pet)

type alias Pet =
    { name : String
    , availableIn : Int
    , picture : Maybe String
    }
