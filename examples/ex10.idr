module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    -- draw background
    setFillStyle "#FD0" ctx
    fillRect 0 0 75 75 ctx
    setFillStyle "#6C0" ctx
    fillRect 75 0 75 75 ctx
    setFillStyle "#09F" ctx
    fillRect 0 75 75 75 ctx
    setFillStyle "#F30" ctx
    fillRect 75 75 75 75 ctx
    setFillStyle "#FFF" ctx
    -- set transparency value
    setGlobalAlpha 0.2 ctx
    -- draw semi transparent circles
    for_ [0..6] $ \i => do
        beginPath ctx
        arc 75 75 (10 + 10 * cast i) 0 (pi * 2) True ctx
        fill ctx

main : JS_IO ()
main = start render
