module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    fillRect 25 25 100 100 ctx
    clearRect 45 45 60 60 ctx
    strokeRect 50 50 50 50 ctx

main : JS_IO ()
main = start render
