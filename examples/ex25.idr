module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    -- left rectangles, rotate from canvas origin
    save ctx
    setFillStyle "#0095DD" ctx
    fillRect 30 30 100 100 ctx
    rotate (pi / 180 * 25) ctx
    setFillStyle "#4D4E53" ctx
    fillRect 30 30 100 100 ctx
    restore ctx
    -- right rectangles, rotate from rectangle center
    setFillStyle "#0095DD" ctx
    translate 200 80 ctx
    rotate (pi / 180 * 25) ctx
    translate (-200) (-80) ctx
    setFillStyle "#4D4E53" ctx
    fillRect 150 30 100 100 ctx

main : JS_IO ()
main = start render
