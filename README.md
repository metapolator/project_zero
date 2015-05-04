# Project Zero
is a font project that forks  [Rozha One, a Devanagari + Latin family for Google Fonts](https://github.com/itfoundry/rozhaone)
into a super family setup using [Metapolator](https://github.com/metapolator/metapolator).

The project aims to collect first experiences with Metapolator and to create
commonly useful CPS for different tasks as well as to explore the possibilities
of Metapolator as a tool e.g. to do metapolation and/or interpolation.

The project was under heavy development from October 2014 to March 2015

## Dependencies

[Metapolator](https://github.com/metapolator/metapolator) from its `master`
branch to run the `./serve` skript---starting the red pill interface server---or
to just export some masters  `./serve` uses `mp` as the `metapolator` command name.

To run the `./reimport` skript you'll need

* [fontforge](https://github.com/fontforge/fontforge) a current version of the python module (best compiled freshly from master)
* [robofab](https://github.com/graphicore/robofab/tree/fix-writing-plist) from its `ufo3k` branch with some bugfixes.
* [defcon](https://github.com/graphicore/defcon/tree/ufo3) from its `ufo3` branch with a little bugfix.
* [Metapolator](https://github.com/metapolator/metapolator) from `master`,
   the script uses `mp` as the `metapolator` command name.
