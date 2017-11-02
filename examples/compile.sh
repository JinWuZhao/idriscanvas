#!/bin/bash

export IDRISJS_OPTIM=$2
export IDRISJS_DEBUG=$3
idris -p idriscanvas --codegen javascript  $1 -o ${1%%.idr}.js
