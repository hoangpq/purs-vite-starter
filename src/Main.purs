module Main where

import Prelude

import App.Counter (mkCounter)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)
import Effect.Unsafe (unsafePerformEffect)

import Effect.Console (log)

--main :: Effect Unit
--main = do
--  doc <- document =<< window
--  container <- getElementById "app" $ toNonElementParentNode doc
--  counter <- mkCounter
--  case container of
--    Nothing -> throw "Could not find container element"
--    Just c -> render (counter {}) c

main = do
  log "Running!"