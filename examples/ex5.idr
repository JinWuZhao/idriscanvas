module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = for_ [0..3] $ \i => do
                 for_ [0..2] $ \j => do
                     beginPath ctx
                     let x = 25 + cast j * 50
                     let y = 25 + cast i * 50
                     let endAngle = pi + pi * cast j / 2
                     let anticlockwise = (i `mod` 2) /= 0
                     arc x y 20 0 endAngle anticlockwise ctx
                     if i > 1 then fill ctx else stroke ctx

main : JS_IO ()
main = start render
