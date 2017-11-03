module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    for_ [0..9] $ \i => do
        setLineWidth  (1 + cast i) ctx
        beginPath ctx
        moveTo (5 + cast i * 14) 5 ctx
        lineTo (5 + cast i * 14) 140 ctx
        stroke ctx

main : JS_IO ()
main = start render
