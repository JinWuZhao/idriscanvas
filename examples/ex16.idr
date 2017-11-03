module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    radgrad <- createRadialGradient 45 45 10 52 50 30 ctx
    addColorStop 0 "#A7D30C" radgrad
    addColorStop 0.9 "#019F62" radgrad
    addColorStop 1 (rgbaColor 1 159 98 0) radgrad
    radgrad2 <- createRadialGradient 105 105 20 112 120 50 ctx
    addColorStop 0 "#FF5F98" radgrad2
    addColorStop 0.75 "#FF0188" radgrad2
    addColorStop 1 (rgbaColor 255 1 136 0) radgrad2
    radgrad3 <- createRadialGradient 95 15 15 102 20 40 ctx
    addColorStop 0 "#00C9FF" radgrad3
    addColorStop 0.8 "#00B5E2" radgrad3
    addColorStop 1 (rgbaColor 0 201 255 0) radgrad3
    radgrad4 <- createRadialGradient 0 150 50 0 140 90 ctx
    addColorStop 0 "#F4F201" radgrad4
    addColorStop 0.8 "#E4C700" radgrad4
    addColorStop 1 (rgbaColor 255 199 0 0) radgrad4

    setFillStyle radgrad4 ctx
    fillRect 0 0 150 150 ctx
    setFillStyle radgrad3 ctx
    fillRect 0 0 150 150 ctx
    setFillStyle radgrad2 ctx
    fillRect 0 0 150 150 ctx
    setFillStyle radgrad ctx
    fillRect 0 0 150 150 ctx

main : JS_IO ()
main = start render
