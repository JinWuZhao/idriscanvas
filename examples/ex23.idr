module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    fillRect 0 0 150 150 ctx
    save ctx
    setFillStyle "#09F" ctx
    fillRect 15 15 120 120 ctx
    save ctx
    setFillStyle "#FFF" ctx
    setGlobalAlpha 0.5 ctx
    fillRect 30 30 90 90 ctx
    restore ctx
    fillRect 45 45 60 60 ctx
    restore ctx
    fillRect 60 60 30 30 ctx

main : JS_IO ()
main = start render
