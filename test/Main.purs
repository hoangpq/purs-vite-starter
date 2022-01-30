module Test.Main where

import Prelude

import Effect (Effect)
-- import Effect.Class.Console (log)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  runTest do
    suite "equal" do
      test "2 + 3 = 5" do
        Assert.equal 5 (2 + 3)
        