module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    let lineJoin = [LineJoinRound, LineJoinBevel, LineJoinMiter]
    setLineWidth 10 ctx
    for_ [0..(length lineJoin - 1)] $ \i => do
        case index' i lineJoin of
            Nothing => pure ()
            Just join => setLineJoin join ctx
        beginPath ctx
        moveTo (-5) (5 + cast i * 40) ctx
        lineTo 35 (45 + cast i * 40) ctx
        lineTo 75 (5 + cast i * 40) ctx
        lineTo 115 (45 + cast i * 40) ctx
        lineTo 155 (5 + cast i * 40) ctx
        stroke ctx

main : JS_IO ()
main = start render
