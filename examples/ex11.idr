module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    -- draw background
    setFillStyle (rgbColor 255 221 0) ctx
    fillRect 0 0 150 37.5 ctx
    setFillStyle (rgbColor 102 204 0) ctx
    fillRect 0 37.5 150 37.5 ctx
    setFillStyle (rgbColor 0 153 255) ctx
    fillRect 0 75 150 37.5 ctx
    setFillStyle (rgbColor 255 51 0) ctx
    fillRect 0 112.5 150 37.5 ctx
    -- draw semi transparent rectangles
    for_ [0..9] $ \i => do
        setFillStyle (rgbaColor 255 255 255 ((cast i + 1) / 10)) ctx
        for_ [0..9] $ \j => do
            fillRect (5 + cast i * 14) (5 + cast j * 37.5) 14 27.5 ctx

main : JS_IO ()
main = start render
