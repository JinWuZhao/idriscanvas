module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    beginPath ctx
    moveTo 75 50 ctx
    lineTo 100 75 ctx
    lineTo 100 25 ctx
    fill ctx

main : JS_IO ()
main = start render
