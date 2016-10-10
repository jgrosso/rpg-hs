module Player
  ( mkPlayer
  , Player(..)
  ) where

import Inventory (emptyInventory, Inventory)
import Name (Name)
import PlayerClass (PlayerClass)
import Stats (initialStats, Stats)

type Player =
  { inventory ∷ Inventory
  , name ∷ Name
  , playerClass ∷ PlayerClass
  , stats ∷ Stats
  }

mkPlayer ∷ PlayerClass → Name → Player
mkPlayer playerClass name =
  { inventory: emptyInventory
  , name: name
  , playerClass: playerClass
  , stats: initialStats playerClass
  }
