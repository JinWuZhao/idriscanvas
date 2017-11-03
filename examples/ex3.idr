module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    beginPath ctx
    arc 75 75 50 0 (pi * 2) True ctx
    moveTo 110 75 ctx
    arc 75 75 35 0 pi False ctx
    moveTo 65 65 ctx
    arc 60 65 5 0 (pi * 2) True ctx
    moveTo 95 65 ctx
    arc 90 65 5 0 (pi * 2) True ctx
    stroke ctx

main : JS_IO ()
main = start render
