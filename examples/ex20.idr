module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    img <- newImage
    setSrc "images/backdrop.png" img
    onload img $ \_ => do
        drawImage (toRef img) 0 0 ctx
        beginPath ctx
        moveTo 30 96 ctx
        lineTo 70 66 ctx
        lineTo 103 76 ctx
        lineTo 170 15 ctx
        stroke ctx

main : JS_IO ()
main = start render
