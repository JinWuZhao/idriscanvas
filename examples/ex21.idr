module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    img <- newImage
    setSrc "images/rhino.jpg" img
    flip onload img $ \_ => do
        for_ [0..3] $ \i => do
            for_ [0..2] $ \j => do
                drawImage (toRef img) (cast j * 50) (cast i * 38) 50 38 ctx

main : JS_IO ()
main = start render
