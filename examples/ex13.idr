module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    let lineCap = [LineCapButt, LineCapRound, LineCapSquare]
    -- draw guides
    setStrokeStyle "#09f" ctx
    beginPath ctx
    moveTo 10 10 ctx
    lineTo 140 10 ctx
    moveTo 10 140 ctx
    lineTo 140 140 ctx
    stroke ctx
    -- draw lines
    setStrokeStyle "black" ctx
    for_ [0..(length lineCap - 1)] $ \i => do
        setLineWidth 15 ctx
        case index' i lineCap of
            Nothing => pure ()
            Just cap => setLineCap cap ctx
        beginPath ctx
        moveTo (25 + cast i * 50) 10 ctx
        lineTo (25 + cast i * 50) 140 ctx
        stroke ctx

main : JS_IO ()
main = start render
