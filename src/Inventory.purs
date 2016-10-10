module Inventory
  ( emptyInventory
  , Inventory(..)
  ) where

import Item (Item)

newtype Inventory = Inventory
  (Array Item)

emptyInventory ∷ Inventory
emptyInventory =
  Inventory []
