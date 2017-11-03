module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    setShadowOffsetX 2 ctx
    setShadowOffsetY 2 ctx
    setShadowBlur 2 ctx
    setShadowColor (rgbaColor 0 0 0 0.5) ctx
    setFont "20px Times New Roman" ctx
    setFillStyle "Black" ctx
    fillText "Sample String" 5 30 ctx

main : JS_IO ()
main = start render
