module StrongCheckExample (exampleMain) where

import Prelude

import Effect (Effect)

import Data.Generic.Rep (class Generic, gShow)

import Test.StrongCheck.Gen (Gen, showSample)
import Test.StrongCheck.Generic (gArbitrary)

data Tree a = Leaf | Branch { value :: a, kids :: Array (Tree a) }

derive instance genericTree :: (Generic a) => Generic (Tree a)

instance showTree :: (Show a, Generic a) => Show (Tree a) where
  show = gShow

exampleMain :: Effect Unit
exampleMain = showSample (gArbitrary :: Gen (Tree Int))
