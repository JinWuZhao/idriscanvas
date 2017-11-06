module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    setFont "48px serif" ctx
    fillText "Hello world" 10 50 ctx
    setTextBaseline TextBaselineHanging ctx
    strokeText "Hello world" 10 150 ctx

main : JS_IO ()
main = start render
