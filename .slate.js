slate.cfga({
  "defaultToCurrentScreen" : true,
  "nudgePercentOf" : "screenSize",
  "resiezePercentOf" : "screenSize"
});

var halfLeft_fullHeight       = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY", "width": "screenSizeX/2", "height": "screenSizeY"});
var halfRight_fullHeight      = slate.op("move", {"x": "screenOriginX+(screenSizeX/2)", "y": "screenOriginY", "width": "screenSizeX/2", "height": "screenSizeY"});
var halfTop_fullWidth         = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY", "width": "screenSizeX", "height": "screenSizeY/2"});
var halfBottom_fullWidth      = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY+(screenSizeY/2)", "width": "screenSizeX", "height": "screenSizeY/2"});
var full                      = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY", "width": "screenSizeX", "height": "screenSizeY"});
var leftThird_fullHeight      = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY", "width": "screenSizeX/3", "height": "screenSizeY"});
var middleThird_fullHeight    = slate.op("move", {"x": "screenOriginX+(screenSizeX/3)", "y": "screenOriginY", "width": "screenSizeX/3", "height": "screenSizeY"});
var rightThird_fullHeight     = slate.op("move", {"x": "screenOriginX+((screenSizeX/3)*2)", "y": "screenOriginY", "width": "screenSizeX/3", "height": "screenSizeY"});
var leftTwoThirds_fullHeight  = slate.op("move", {"x": "screenOriginX", "y": "screenOriginY", "width": "(screenSizeX/3)*2", "height": "screenSizeY"});
var rightTwoThirds_fullHeight = slate.op("move", {"x": "screenOriginX+(screenSizeX/3)", "y": "screenOriginY", "width": "(screenSizeX/3)*2", "height": "screenSizeY"});

slate.bnda({
  "esc:cmd": slate.op("hint"),
  "space:cmd;alt;ctrl": slate.op("grid"),
  "h:ctrl;alt;cmd": halfLeft_fullHeight,
  "l:ctrl;alt;cmd": halfRight_fullHeight,
  "k:ctrl;alt;cmd": halfTop_fullWidth,
  "j:ctrl;alt;cmd": halfBottom_fullWidth,
  "y:ctrl;alt;cmd": leftThird_fullHeight,
  "u:ctrl;alt;cmd": middleThird_fullHeight,
  "i:ctrl;alt;cmd": rightThird_fullHeight,
  "b:ctrl;alt;cmd": leftTwoThirds_fullHeight,
  ",:ctrl;alt;cmd": rightTwoThirds_fullHeight,
  "o:ctrl;alt;cmd": full
});

