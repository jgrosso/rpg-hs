module Stats
  ( Agility(..)
  , initialStats
  , Intelligence(..)
  , levelUp
  , Stats(..)
  , Strength(..)
  ) where

import PlayerClass (PlayerClass(..))
import Prelude ((+))

newtype Agility = Agility
  Int

newtype Intelligence = Intelligence
  Int

newtype Strength = Strength
  Int

type Stats =
  { agility ∷ Agility
  , intelligence ∷ Intelligence
  , strength ∷ Strength
  }
type StatsΔ =
  Stats

initialStats ∷ PlayerClass → Stats
initialStats Barbarian =
  { agility: Agility 1
  , intelligence: Intelligence 1
  , strength: Strength 3
  }
initialStats Mage =
  { agility: Agility 1
  , intelligence: Intelligence 3
  , strength: Strength 1
  }

levelUp ∷ Stats → StatsΔ → Stats
levelUp stats statsΔ =
  { agility: stats.agility `agilityPlus` statsΔ.agility
  , intelligence: stats.intelligence `intelligencePlus` statsΔ.intelligence
  , strength: stats.strength `strengthPlus` statsΔ.strength
  }
  where
    agilityPlus ∷ Agility → Agility → Agility
    agilityPlus (Agility x) (Agility y) = Agility (x + y)

    intelligencePlus ∷ Intelligence → Intelligence → Intelligence
    intelligencePlus (Intelligence x) (Intelligence y) = Intelligence (x + y)

    strengthPlus ∷ Strength → Strength → Strength
    strengthPlus (Strength x) (Strength y) = Strength (x + y)
