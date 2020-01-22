{ name =
    "my-project"
, dependencies =
    [ "console"
    , "debug"
    , "effect"
    , "heterogeneous"
    , "numbers"
    , "parsing"
    , "precise-datetime"
    , "prelude"
    , "profunctor-lenses"
    , "psci-support"
    , "random"
    , "react"
    , "react-dom"
    , "record"
    , "routing"
    , "routing-duplex"
    , "run"
    , "semirings"
    , "unsafe-reference"
    , "uri"
    , "validation"
    , "variant"
    , "web-dom"
    , "web-events"
    , "web-fetch"
    , "web-file"
    , "web-html"
    , "web-uievents"
    , "web-xhr"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs" ]
}
