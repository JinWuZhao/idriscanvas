module Main

import IdrisCanvas
import Helpers.Launch

random : JS_IO Double
random = jscall "Math.random()" (JS_IO Double)

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    fillRect 0 0 150 150 ctx
    translate 75 75 ctx
    -- Create a circular clipping path
    beginPath ctx
    arc 0 0 60 0 (pi * 2) True ctx
    clip ctx
    -- draw background
    lingrad <- createLinearGradient 0 (-75) 0 75 ctx
    addColorStop 0 "#232256" lingrad
    addColorStop 1 "#143778" lingrad
    setFillStyle lingrad ctx
    fillRect (-75) (-75) 150 150 ctx
    -- draw stars
    for_ [1..49] $ \j => do
        save ctx
        setFillStyle "#fff" ctx
        translate (75 - (floor (!random * 150))) (75 - (floor (!random * 150))) ctx
        drawStar (floor (!random * 4) + 2) ctx
        restore ctx

where
    drawStar : Double -> CanvasRenderingContext2D -> JS_IO ()
    drawStar r ctx = do
        save ctx
        beginPath ctx
        moveTo r 0 ctx
        for_ [0..8] $ \i => do
            rotate (pi / 5) ctx
            if (i `mod` 2) == 0 then lineTo (r / 0.525731 * 0.200811) 0 ctx
            else lineTo r 0 ctx

        closePath ctx
        fill ctx
        restore ctx

main : JS_IO ()
main = start render
