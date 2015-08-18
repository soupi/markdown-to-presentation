
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import System.Environment
import qualified Text.Markdown as MD
import qualified Data.Text.Lazy as T()
import qualified Data.Text.Lazy.IO as TIO
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html5 ((!))
import Text.Blaze.Html.Renderer.Text as HR

main :: IO ()
main =
  getArgs >>= \case
    [src, dest] -> do
      input <- TIO.readFile src
      let htmlProcess = HR.renderHtml $ template src $ MD.markdown MD.def input
      TIO.writeFile dest htmlProcess
    _ ->
      putStrLn "Usage: md2p <src> <dest>"

template :: String -> H.Html -> H.Html
template title htm =
  H.docTypeHtml $ do
    H.head $ do
      H.meta ! A.charset "utf-8"
      H.title (H.toHtml title)
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "css/style.css"
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "css/github.css"
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "highlight/styles/docco.css"
    H.body $ do
      H.div ! A.class_ "container" $ htm
      H.script ! A.src "js/jquery-1.11.0.min.js" $ ""
      H.script ! A.src "highlight/highlight.pack.js" $ ""
      H.script ! A.src "js/present.js" $ ""
      H.script   "hljs.initHighlightingOnLoad();"
