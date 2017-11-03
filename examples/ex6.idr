module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    beginPath ctx
    moveTo 75 25 ctx
    quadraticCurveTo 25 25 25 62.5 ctx
    quadraticCurveTo 25 100 50 100 ctx
    quadraticCurveTo 50 120 30 125 ctx
    quadraticCurveTo 60 120 65 100 ctx
    quadraticCurveTo 125 100 125 62.5 ctx
    quadraticCurveTo 125 25 75 25 ctx
    stroke ctx

main : JS_IO ()
main = start render
