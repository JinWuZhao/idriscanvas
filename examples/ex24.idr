module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    for_ [0..2] $ \i => do
        for_ [0..2] $ \j => do
            save ctx
            setFillStyle (rgbColor (51 * i) (255 - 51 * i) 255) ctx
            translate (10 + cast j * 50) (10 + cast i * 50) ctx
            fillRect 0 0 25 25 ctx
            restore ctx

main : JS_IO ()
main = start render
