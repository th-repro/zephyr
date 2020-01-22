{ name =
    "my-project"
, dependencies =
    [ "console", "effect", "psci-support", "web-fetch" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs" ]
}
