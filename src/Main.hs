{-# LANGUAGE OverloadedStrings #-}

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
main = do
  args <- getArgs
  if getNumFromList 2 args then (TIO.readFile (args !! 0) >>= return . HR.renderHtml  . (template (args !! 0)). (MD.markdown MD.def) >>= TIO.writeFile (args !! 1))
    else putStrLn "[Usage: m2p <src> <dest>]"

getNumFromList :: Int -> [a] -> Bool
getNumFromList 0 _ = True
getNumFromList _ [] = False
getNumFromList n (_:xs) = getNumFromList (n-1) xs


template :: String -> H.Html -> H.Html
template title htm = do
  H.docTypeHtml $ do
    H.head $ do
      H.meta ! A.charset "utf-8"
      H.title (H.toHtml title)
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "css/style.css"
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "css/github.css"
      H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "highlight/styles/solarized_light.css"
    H.body $ do
      H.div ! A.class_ "container" $ do
        htm
      H.script ! A.src "js/jquery-1.11.0.min.js" $ ""
      H.script ! A.src "highlight/highlight.pack.js" $ ""
      H.script ! A.src "js/present.js" $ ""
      H.script $ "hljs.initHighlightingOnLoad();"
