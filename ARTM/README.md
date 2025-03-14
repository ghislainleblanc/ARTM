#ARTM

## Architecture

MVVM avec dependancy injection. Le Strict Concurrency Checking (Swift 6) est activé donc j'utilise un acteur pour CountryService afin de garantir le 
thread safety.

## Raccourcis et assomptions

Les requis parlaient du continent (singulier) alors j'affiche seulement le premier même si techniquement certains pays sont à cheval sur plus d'un continent.

## Unit tests

Il n'y a pas grand chose à tester alors je tests que les différents états possibles du view model fonctionnent tels qu'attendus.

## Localization

English + French (Canada)
