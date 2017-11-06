module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    let sinv = sin (pi / 6)
    let cosv = cos (pi / 6)
    translate 100 100 ctx
    for_ [0..12] $ \i => do
        let c = cast $ floor (255 / 12 * cast i)
        setFillStyle (rgbColor c c c) ctx
        fillRect 0 0 100 10 ctx
        transform cosv sinv (-sinv) cosv 0 0 ctx

    setTransform (-1) 0 0 1 100 100 ctx
    setFillStyle (rgbaColor 255 128 255 0.5) ctx
    fillRect 0 50 100 100 ctx

main : JS_IO ()
main = start render
