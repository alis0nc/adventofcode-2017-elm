module Day1 exposing (..)

import Char exposing (toCode)
import List exposing (..)
import Html exposing (Html, text, table, thead, th, tr, td)
import Html.Attributes exposing (class, src, width)

input : String
input = "57276274387944537823652626177853384411146325384494935924454336611953119173638191671326254832624841593421667683474349154668177743437745965461678636631863541462893547616877914914662358836365421198516263335926544716331814125295712581158399321372683742773423626286669759415959391374744214595682795818615532673877868424196926497731144319736445141728123322962547288572434564178492753681842244888368542423832228211172842456231275738182764232265933625119312598161192193214898949267765417468348935134618964683127194391796165368145548814473129857697989322621368744725685183346825333247866734735894493395218781464346951777873929898961358796274889826894529599645442657423438562423853247543621565468819799931598754753467593832328147439341586125262733737128386961596394728159719292787597426898945198788211417854662948358422729471312456437778978749753927251431677533575752312447488337156956217451965643454445329758327129966657189332824969141448538681979632611199385896965946849725421978137753366252459914913637858783146735469758716752765718189175583956476935185985918536318424248425426398158278111751711911227818826766177996223718837428972784328925743869885232266127727865267881592395643836999244218345184474613129823933659422223685422732186536199153988717455568523781673393698356967355875123554797755491181791593156433735591529495984256519631187849654633243225118132152549712643273819314433877592644693826861523243946998615722951182474773173215527598949553185313259992227879964482121769617218685394776778423378182462422788277997523913176326468957342296368178321958626168785578977414537368686438348124283789748775163821457641135163495649331144436157836647912852483177542224864952271874645274572426458614384917923623627532487625396914111582754953944965462576624728896917137599778828769958626788685374749661741223741834844643725486925886933118382649581481351844943368484853956759877215252766294896496444835264357169642341291412768946589781812493421379575569593678354241223363739129813633236996588711791919421574583924743119867622229659211793468744163297478952475933163259769578345894367855534294493613767564497137369969315192443795512585"

initialModel : Model
initialModel = {}
type alias Model = {}
view : Model -> Html Msg
view model = 
    table []
        [ thead []
            [ th [][text "Part"]
            , th [][text "Solution"]
            ]
        , tr []
            [ td [][text "1"]
            , td [][text (toString (day1 input))]
            ]
        , tr []
            [ td [][text "2"]
            , td [][text (toString (day1part2 input))]
            ]
        ]

--    text (toString (day1 input))
--    text (toString (day1part2 input))
    

type Msg
    = None

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = (model, Cmd.none)

subscriptions : a -> Sub msg
subscriptions =
    \_ -> Sub.none

{- 
The captcha requires you to review a sequence of digits (your puzzle input) 
and find the sum of all digits that match the next digit in the list. 
The list is circular, so the digit after the last digit is the first digit 
in the list. 
-}
day1 : String -> Int
day1 x =
    recurse 
        ( x
            |> String.toList 
            |> listDigitsToListNumbers
            |> (\a -> append a (take 1 a)) -- circularity
        )
        0
        
recurse : List Int -> Int -> Int
recurse x summa =
    if head x == Nothing then -- termination case, we've run out of the list
        summa
    else if head x == head (tail x |> Maybe.withDefault []) then -- the current digit matches the next digit
        recurse (tail x |> Maybe.withDefault []) (summa + (head x |> Maybe.withDefault 0))
    else
        recurse (tail x |> Maybe.withDefault []) summa

{-
Now, instead of considering the next digit, it wants you to consider the digit 
halfway around the circular list. That is, if your list contains 10 items, only 
include a digit in your sum if the digit 10/2 = 5 steps forward matches it. 
Fortunately, your list has an even number of elements. 
-}
day1part2 : String -> Int
day1part2 x = 
    x
        |> String.toList
        |> listDigitsToListNumbers
        |> day1part2b

day1part2b : List Int -> Int
day1part2b x =
    map2 (,) (take (length x // 2) x) (reverse (take (length x // 2) (reverse x))) -- we have each digit and its halfway-counterpart
        |> filter (\t -> Tuple.first t == Tuple.second t)
        |> map Tuple.first
        |> sum
        |> (*) 2

{- Helper function that gives a list of Int from a list of Char [digits]. -}
asciiOffset : Int
asciiOffset = toCode '0'
listDigitsToListNumbers : List Char -> List Int
listDigitsToListNumbers listOfDigits =
    listOfDigits
        |> List.map toCode 
        |> List.map (\x -> x - asciiOffset)
        |> List.filter (\x -> 0 <= x && x <= 9) -- Silently dump invalid values. Whatever. This is an academic exercise.

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }
init : ( Model, Cmd msg )
init =  (initialModel, Cmd.none)