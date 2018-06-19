module Main exposing (..)

import Task
import NativeUi as Ui exposing (Node)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Events exposing (..)
import NativeUi.Image as Image exposing (..)
import NativeUi.Alert as Alert


-- MODEL


type alias Model =
    { n : Int
    , failed : String
    }


model : Model
model =
    { n = 9000
    , failed = "ok"
    }


-- UPDATE


type Msg
    = Increment
    | Decrement
    | Alert
    | Alerted (Result String Bool)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | n = model.n + 1 }, Cmd.none )

        Decrement ->
            ( { model | n = model.n - 1 }, Cmd.none )

        Alert ->
            let
                cmd =
                    Alert.alert "hello here!" "and there..." []
                    |> Task.attempt Alerted
                    -- Task.perform 1 2 (qalert "hi" "there")
                    -- Task.perform FailedAlert -- Alerted <| 
                    -- <| qalert "hello heres!" "aind deres..."
                    -- Alert.alert "hello here!" "and there..." []
                    -- |> Task.perform (\x -> FailedAlert x) -- (\b -> Alerted b)
            in
                ( model, cmd )

        Alerted (Ok _) ->
            ( { model | failed = "ok alerted" }, Cmd.none )

        Alerted (Err err) ->
            ( { model | failed = err }, Cmd.none )


-- VIEW


view : Model -> Node Msg
view model =
    let
        imageSource =
            { uri = "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
            , cache = Just ForceCache
            }
    in
        Elements.view
            [ Ui.style [ Style.alignItems "center" ]
            ]
            [ image
                [ Ui.style
                    [ Style.height 64
                    , Style.width 64
                    , Style.marginBottom 30
                    , Style.marginTop 30
                    ]
                , source imageSource
                ]
                []
            , text
                [ Ui.style
                    [ Style.textAlign "center"
                    , Style.marginBottom 30
                    ]
                ]
                [ Ui.string ("Counter: " ++ toString model.n)
                ]
            , Elements.view
                [ Ui.style
                    [ Style.width 80
                    , Style.flexDirection "row"
                    , Style.justifyContent "space-between"
                    ]
                ]
                [ button Decrement "#d33" "-"
                , button Increment "#3d3" "+"
                ]
            , text
                [ Ui.style
                    [ Style.textAlign "center"
                    , Style.marginBottom 30
                    ]
                ]
                [ Ui.string ("err? : " ++ model.failed)
                ]
            , button Alert "#33d" "!"
            ]


button : Msg -> String -> String -> Node Msg
button msg color content =
    text
        [ Ui.style
            [ Style.color "white"
            , Style.textAlign "center"
            , Style.backgroundColor color
            , Style.paddingTop 5
            , Style.paddingBottom 5
            , Style.width 30
            , Style.fontWeight "bold"
            , Style.shadowColor "#000"
            , Style.shadowOpacity 0.25
            , Style.shadowOffset 1 1
            , Style.shadowRadius 5
            , Style.transform { defaultTransform | rotate = Just "10deg" }
            ]
        , onPress msg
        ]
        [ Ui.string content ]



-- PROGRAM


main : Program Never Model Msg
main =
    Ui.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
