#ARTM

## Architecture

MVVM avec dependancy injection. Le Strict Concurrency Checking (Swift 6) est activé donc j'utilise un acteur pour CountryService afin de garantir le 
thread safety.

## Raccourcis et assomptions

Les requis parlaient du continent (singulier) alors j'affiche seulement le premier même si techniquement certains pays sont à cheval sur plus d'un continent.

## Unit tests

Il n'y a pas grand chose à tester alors je test que les différents états possibles du view model fonctionnent tels qu'attendus.

## Localization

English + French (Canada)

## Error handling

En cas d'erreur de chargement/parsing de la liste de pays, j'affiche l'erreur au lieu de la liste. En cas d'erreur pour le chargement de l'image d'un drapeau, je met un placeholder à la place du drapeau.
