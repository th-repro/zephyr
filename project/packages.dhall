let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.5-20200103/packages.dhall sha256:0a6051982fb4eedb72fbe5ca4282259719b7b9b525a4dda60367f98079132f30

let overrides = {=}

let additions =
  { web-fetch =
      { dependencies =
          [ "prelude"
          , "effect"
          , "http-methods"
          , "typelevel-prelude"
          , "web-file"
          , "record"
          , "foreign-object"
          , "web-promise"
          , "web-streams"
          ]
      , repo =
          "https://github.com/purescript-web/purescript-web-fetch.git"
      , version =
          "v1.0.1"
      }

  , web-promise =
      { dependencies =
          [ "prelude"
          , "effect"
          , "maybe"
          , "functions"
          , "exceptions"
          ]
      , repo =
          "https://github.com/purescript-web/purescript-web-promise.git"
      , version =
          "v1.0.0"
      }

  , web-streams =
      { dependencies =
          [ "prelude"
          , "effect"
          , "nullable"
          , "arraybuffer-types"
          , "tuples"
          , "web-promise"
          , "exceptions"
          ]
      , repo =
          "https://github.com/purescript-web/purescript-web-streams.git"
      , version =
          "v1.0.0"
      }
  }

in  upstream // overrides // additions
