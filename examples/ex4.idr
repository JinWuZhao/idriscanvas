module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    -- Filled triangle
    beginPath ctx
    moveTo 25 25 ctx
    lineTo 105 25 ctx
    lineTo 25 105 ctx
    fill ctx
    -- Stroked triangle
    beginPath ctx
    moveTo 125 125 ctx
    lineTo 125 45 ctx
    lineTo 45 125 ctx
    closePath ctx
    stroke ctx

main : JS_IO ()
main = start render
