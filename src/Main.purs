module Main
  ( main
  ) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Foldable (intercalate)
import Data.Semigroup ((<>))
import Data.Traversable (traverse_)
import Inventory (Inventory(..))
import Item (Item(..))
import Name (Name(..))
import Player (mkPlayer, Player)
import PlayerClass (PlayerClass(..))
import Prelude (($), map, show, Unit)
import Stats (Agility(..), Intelligence(..), Stats, Strength(..))

showPlayer ∷ Player → String
showPlayer player =
  "Player: " <> showInventory player.inventory <> "; " <> showName player.name <> "; " <> showPlayerClass player.playerClass <> "; " <> showStats player.stats
  where
    showInventory ∷ Inventory → String
    showInventory (Inventory inventory) =
      "Inventory: [ " <> intercalate "," (map showItem inventory) <> " ]"
      where
        showItem ∷ Item → String
        showItem Key =
          "Key"

    showName ∷ Name → String
    showName (Name name) =
      "Name: " <> name

    showPlayerClass ∷ PlayerClass → String
    showPlayerClass playerClass =
      "Class: " <> case playerClass of
        Barbarian →
          "Barbarian"
        Mage →
          "Mage"

    showStats ∷ Stats → String
    showStats stats =
      "Stats: { " <> showAgility stats.agility <> ", " <> showIntelligence stats.intelligence <> ", " <> showStrength stats.strength <> " }"
      where
        showAgility ∷ Agility → String
        showAgility (Agility agility) =
          "Agility: " <> show agility

        showIntelligence ∷ Intelligence → String
        showIntelligence (Intelligence intelligence) =
          "Intelligence: " <> show intelligence

        showStrength ∷ Strength → String
        showStrength (Strength strength) =
          "Strength: " <> show strength

main ∷ ∀ e. Eff (console ∷ CONSOLE | e) Unit
main =
  traverse_ (\playerClass → log $ show $ showPlayer $ mkPlayer playerClass (Name "Test")) [Barbarian, Mage]
