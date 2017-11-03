module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    for_ [0..5] $ \i => do
        for_ [0..5] $ \j => do
            setStrokeStyle (rgbColor 0
                                     (cast $ floor $ 255 - 42.5 * cast i)
                                     (cast $ floor $ 255 - 42.5 * cast j))
                           ctx
            beginPath ctx
            arc (12.5 + cast j * 25) (12.5 + cast i * 25) 10 0 (pi * 2) True ctx
            stroke ctx

main : JS_IO ()
main = start render
