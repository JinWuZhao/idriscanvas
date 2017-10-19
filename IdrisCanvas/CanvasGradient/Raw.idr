module IdrisCanvas.CanvasGradient.Raw

import IdrisCanvas.Tools

%access public export

addColorStop : Ptr -> Double -> String -> JS_IO ()
addColorStop gradient offset color = jscall "%0.addColorStop(%1, %2)"
                                            (Ptr -> Double -> String -> JS_IO ())
                                            gradient offset color
