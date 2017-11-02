module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    setFillStyle (rgbColor 200 0 0) ctx
    fillRect 10 10 55 50 ctx
    setFillStyle (rgbaColor 0 0 200 0.5) ctx
    fillRect 30 30 55 50 ctx

main : JS_IO ()
main = start render
