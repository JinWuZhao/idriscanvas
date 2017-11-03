module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    for_ [0..5] $ \i => do
        for_ [0..5] $ \j => do
            setFillStyle (rgbColor (cast $ floor (255 - 42.5 * cast i))
                                   (cast $ floor (255 - 42.5 * cast j))
                                   0) ctx
            fillRect (25 * cast j) (25 * cast i) 25 25 ctx

main : JS_IO ()
main = start render
