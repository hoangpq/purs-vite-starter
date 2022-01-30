module App.Counter (mkCounter, jsCounter) where

import Prelude

import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, component, useState, (/\))
import React.Basic.Hooks as React

import Data.Int (fromNumber, toNumber)
import Math (max)

import Data.Maybe (Maybe(..), fromMaybe)
import Effect.Unsafe (unsafePerformEffect)

mkCounter :: Component {}
mkCounter = do
  component "Counter" \_ -> React.do
    { count } /\ setCount <- useState { count: 0 }
    pure $ R.div
      { children:
          [ R.text $ "Count: " <> show count
          , R.div
              { className: "counter__container"
              , children:
                  [ R.button
                      { className: "counter__button"
                      , children: [ R.text "+" ]
                      , onClick: handler_ do
                          setCount \state -> { count: state.count + 1 }
                      }
                  , R.button
                      { className: "counter__button"
                      , children: [ R.text "-" ]
                      , onClick: handler_ do
                          setCount \state ->
                            let newCount = fromNumber $ max (toNumber 0) (toNumber (state.count - 1))
                            in { count: fromMaybe state.count newCount }
                      }
                  ]
              }
          ]
      }

jsCounter = unsafePerformEffect mkCounter
