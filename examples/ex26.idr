module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    save ctx
    scale 10 3 ctx
    fillRect 1 10 10 10 ctx
    restore ctx
    scale (-1) 1 ctx
    setFont "48px serif" ctx
    fillText "Idris" (-135) 120 ctx

main : JS_IO ()
main = start render
