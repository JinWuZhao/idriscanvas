module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    lingrad <- createLinearGradient 0 0 0 150 ctx
    addColorStop 0 "#00ABEB" lingrad
    addColorStop 0.5 "#fff" lingrad
    addColorStop 0.5 "#26C000" lingrad
    addColorStop 1 "#fff" lingrad
    lingrad2 <- createLinearGradient 0 50 0 95 ctx
    addColorStop 0.5 "#000" lingrad2
    addColorStop 1 (rgbaColor 0 0 0 0) lingrad2
    setFillStyle lingrad ctx
    setStrokeStyle lingrad2 ctx
    fillRect 10 10 130 130 ctx
    strokeRect 50 50 50 50 ctx

main : JS_IO ()
main = start render
