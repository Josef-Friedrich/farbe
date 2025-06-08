-- farbe.lua
-- Copyright 2025 Josef Friedrich
--
-- This work may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either version 1.3c
-- of this license or (at your option) any later version.
-- The latest version of this license is in
--   http://www.latex-project.org/lppl.txt
-- and version 1.3c or later is part of all distributions of LaTeX
-- version 2008/05/04 or later.
--
-- This work has the LPPL maintenance status `maintained'.
--
-- The Current Maintainer of this work is Josef Friedrich.
--
-- This work consists of the files farbe.lua, farbe.tex,
-- and farbe.sty.
-- https://github.com/latex3/xcolor/blob/main/xcolor.dtx
---@alias r number red (0.0 - 1.0)
---@alias g number green (0.0 - 1.0)
---@alias b number blue (0.0 - 1.0)
---@alias a number alpha (0.0 - 1.0)
---@alias c number cyan (0.0 - 1.0)
---@alias m number magenta (0.0 - 1.0)
---@alias y number yellow (0.0 - 1.0)
---@alias k number key(black) (0.0 - 1.0)
local schemes = {

  base = {
    'black',
    'blue',
    'brown',
    'cyan',
    'darkgray',
    'gray',
    'green',
    'lightgray',
    'lime',
    'magenta',
    'olive',
    'orange',
    'pink',
    'purple',
    'red',
    'teal',
    'violet',
    'white',
    'yellow',
  },

  svg = {
    'AliceBlue',
    'AntiqueWhite',
    'Aqua',
    'Aquamarine',
    'Azure',
    'Beige',
    'Bisque',
    'Black',
    'BlanchedAlmond',
    'Blue',
    'BlueViolet',
    'Brown',
    'BurlyWood',
    'CadetBlue',
    'Chartreuse',
    'Chocolate',
    'Coral',
    'CornflowerBlue',
    'Cornsilk',
    'Crimson',
    'Cyan',
    'DarkBlue',
    'DarkCyan',
    'DarkGoldenrod',
    'DarkGray',
    'DarkGreen',
    'DarkGrey',
    'DarkKhaki',
    'DarkMagenta',
    'DarkOliveGreen',
    'DarkOrange',
    'DarkOrchid',
    'DarkRed',
    'DarkSalmon',
    'DarkSeaGreen',
    'DarkSlateBlue',
    'DarkSlateGray',
    'DarkSlateGrey',
    'DarkTurquoise',
    'DarkViolet',
    'DeepPink',
    'DeepSkyBlue',
    'DimGray',
    'DimGrey',
    'DodgerBlue',
    'FireBrick',
    'FloralWhite',
    'ForestGreen',
    'Fuchsia',
    'Gainsboro',
    'GhostWhite',
    'Gold',
    'Goldenrod',
    'Gray',
    'Green',
    'GreenYellow',
    'Grey',
    'Honeydew',
    'HotPink',
    'IndianRed',
    'Indigo',
    'Ivory',
    'Khaki',
    'Lavender',
    'LavenderBlush',
    'LawnGreen',
    'LemonChiffon',
    'LightBlue',
    'LightCoral',
    'LightCyan',
    'LightGoldenrod',
    'LightGoldenrodYellow',
    'LightGray',
    'LightGreen',
    'LightGrey',
    'LightPink',
    'LightSalmon',
    'LightSeaGreen',
    'LightSkyBlue',
    'LightSlateBlue',
    'LightSlateGray',
    'LightSlateGrey',
    'LightSteelBlue',
    'LightYellow',
    'Lime',
    'LimeGreen',
    'Linen',
    'Magenta',
    'Maroon',
    'MediumAquamarine',
    'MediumBlue',
    'MediumOrchid',
    'MediumPurple',
    'MediumSeaGreen',
    'MediumSlateBlue',
    'MediumSpringGreen',
    'MediumTurquoise',
    'MediumVioletRed',
    'MidnightBlue',
    'MintCream',
    'MistyRose',
    'Moccasin',
    'NavajoWhite',
    'Navy',
    'NavyBlue',
    'OldLace',
    'Olive',
    'OliveDrab',
    'Orange',
    'OrangeRed',
    'Orchid',
    'PaleGoldenrod',
    'PaleGreen',
    'PaleTurquoise',
    'PaleVioletRed',
    'PapayaWhip',
    'PeachPuff',
    'Peru',
    'Pink',
    'Plum',
    'PowderBlue',
    'Purple',
    'Red',
    'RosyBrown',
    'RoyalBlue',
    'SaddleBrown',
    'Salmon',
    'SandyBrown',
    'SeaGreen',
    'Seashell',
    'Sienna',
    'Silver',
    'SkyBlue',
    'SlateBlue',
    'SlateGray',
    'SlateGrey',
    'Snow',
    'SpringGreen',
    'SteelBlue',
    'Tan',
    'Teal',
    'Thistle',
    'Tomato',
    'Turquoise',
    'Violet',
    'VioletRed',
    'Wheat',
    'White',
    'WhiteSmoke',
    'Yellow',
    'YellowGreen',
  },

  x11 = {
    'AntiqueWhite1',
    'AntiqueWhite2',
    'AntiqueWhite3',
    'AntiqueWhite4',
    'Aquamarine1',
    'Aquamarine2',
    'Aquamarine3',
    'Aquamarine4',
    'Azure1',
    'Azure2',
    'Azure3',
    'Azure4',
    'Bisque1',
    'Bisque2',
    'Bisque3',
    'Bisque4',
    'Blue1',
    'Blue2',
    'Blue3',
    'Blue4',
    'Brown1',
    'Brown2',
    'Brown3',
    'Brown4',
    'Burlywood1',
    'Burlywood2',
    'Burlywood3',
    'Burlywood4',
    'CadetBlue1',
    'CadetBlue2',
    'CadetBlue3',
    'CadetBlue4',
    'Chartreuse1',
    'Chartreuse2',
    'Chartreuse3',
    'Chartreuse4',
    'Chocolate1',
    'Chocolate2',
    'Chocolate3',
    'Chocolate4',
    'Coral1',
    'Coral2',
    'Coral3',
    'Coral4',
    'Cornsilk1',
    'Cornsilk2',
    'Cornsilk3',
    'Cornsilk4',
    'Cyan1',
    'Cyan2',
    'Cyan3',
    'Cyan4',
    'DarkGoldenrod1',
    'DarkGoldenrod2',
    'DarkGoldenrod3',
    'DarkGoldenrod4',
    'DarkOliveGreen1',
    'DarkOliveGreen2',
    'DarkOliveGreen3',
    'DarkOliveGreen4',
    'DarkOrange1',
    'DarkOrange2',
    'DarkOrange3',
    'DarkOrange4',
    'DarkOrchid1',
    'DarkOrchid2',
    'DarkOrchid3',
    'DarkOrchid4',
    'DarkSeaGreen1',
    'DarkSeaGreen2',
    'DarkSeaGreen3',
    'DarkSeaGreen4',
    'DarkSlateGray1',
    'DarkSlateGray2',
    'DarkSlateGray3',
    'DarkSlateGray4',
    'DeepPink1',
    'DeepPink2',
    'DeepPink3',
    'DeepPink4',
    'DeepSkyBlue1',
    'DeepSkyBlue2',
    'DeepSkyBlue3',
    'DeepSkyBlue4',
    'DodgerBlue1',
    'DodgerBlue2',
    'DodgerBlue3',
    'DodgerBlue4',
    'Firebrick1',
    'Firebrick2',
    'Firebrick3',
    'Firebrick4',
    'Gold1',
    'Gold2',
    'Gold3',
    'Gold4',
    'Goldenrod1',
    'Goldenrod2',
    'Goldenrod3',
    'Goldenrod4',
    'Green1',
    'Green2',
    'Green3',
    'Green4',
    'Honeydew1',
    'Honeydew2',
    'Honeydew3',
    'Honeydew4',
    'HotPink1',
    'HotPink2',
    'HotPink3',
    'HotPink4',
    'IndianRed1',
    'IndianRed2',
    'IndianRed3',
    'IndianRed4',
    'Ivory1',
    'Ivory2',
    'Ivory3',
    'Ivory4',
    'Khaki1',
    'Khaki2',
    'Khaki3',
    'Khaki4',
    'LavenderBlush1',
    'LavenderBlush2',
    'LavenderBlush3',
    'LavenderBlush4',
    'LemonChiffon1',
    'LemonChiffon2',
    'LemonChiffon3',
    'LemonChiffon4',
    'LightBlue1',
    'LightBlue2',
    'LightBlue3',
    'LightBlue4',
    'LightCyan1',
    'LightCyan2',
    'LightCyan3',
    'LightCyan4',
    'LightGoldenrod1',
    'LightGoldenrod2',
    'LightGoldenrod3',
    'LightGoldenrod4',
    'LightPink1',
    'LightPink2',
    'LightPink3',
    'LightPink4',
    'LightSalmon1',
    'LightSalmon2',
    'LightSalmon3',
    'LightSalmon4',
    'LightSkyBlue1',
    'LightSkyBlue2',
    'LightSkyBlue3',
    'LightSkyBlue4',
    'LightSteelBlue1',
    'LightSteelBlue2',
    'LightSteelBlue3',
    'LightSteelBlue4',
    'LightYellow1',
    'LightYellow2',
    'LightYellow3',
    'LightYellow4',
    'Magenta1',
    'Magenta2',
    'Magenta3',
    'Magenta4',
    'Maroon1',
    'Maroon2',
    'Maroon3',
    'Maroon4',
    'MediumOrchid1',
    'MediumOrchid2',
    'MediumOrchid3',
    'MediumOrchid4',
    'MediumPurple1',
    'MediumPurple2',
    'MediumPurple3',
    'MediumPurple4',
    'MistyRose1',
    'MistyRose2',
    'MistyRose3',
    'MistyRose4',
    'NavajoWhite1',
    'NavajoWhite2',
    'NavajoWhite3',
    'NavajoWhite4',
    'OliveDrab1',
    'OliveDrab2',
    'OliveDrab3',
    'OliveDrab4',
    'Orange1',
    'Orange2',
    'Orange3',
    'Orange4',
    'OrangeRed1',
    'OrangeRed2',
    'OrangeRed3',
    'OrangeRed4',
    'Orchid1',
    'Orchid2',
    'Orchid3',
    'Orchid4',
    'PaleGreen1',
    'PaleGreen2',
    'PaleGreen3',
    'PaleGreen4',
    'PaleTurquoise1',
    'PaleTurquoise2',
    'PaleTurquoise3',
    'PaleTurquoise4',
    'PaleVioletRed1',
    'PaleVioletRed2',
    'PaleVioletRed3',
    'PaleVioletRed4',
    'PeachPuff1',
    'PeachPuff2',
    'PeachPuff3',
    'PeachPuff4',
    'Pink1',
    'Pink2',
    'Pink3',
    'Pink4',
    'Plum1',
    'Plum2',
    'Plum3',
    'Plum4',
    'Purple1',
    'Purple2',
    'Purple3',
    'Purple4',
    'Red1',
    'Red2',
    'Red3',
    'Red4',
    'RosyBrown1',
    'RosyBrown2',
    'RosyBrown3',
    'RosyBrown4',
    'RoyalBlue1',
    'RoyalBlue2',
    'RoyalBlue3',
    'RoyalBlue4',
    'Salmon1',
    'Salmon2',
    'Salmon3',
    'Salmon4',
    'SeaGreen1',
    'SeaGreen2',
    'SeaGreen3',
    'SeaGreen4',
    'Seashell1',
    'Seashell2',
    'Seashell3',
    'Seashell4',
    'Sienna1',
    'Sienna2',
    'Sienna3',
    'Sienna4',
    'SkyBlue1',
    'SkyBlue2',
    'SkyBlue3',
    'SkyBlue4',
    'SlateBlue1',
    'SlateBlue2',
    'SlateBlue3',
    'SlateBlue4',
    'SlateGray1',
    'SlateGray2',
    'SlateGray3',
    'SlateGray4',
    'Snow1',
    'Snow2',
    'Snow3',
    'Snow4',
    'SpringGreen1',
    'SpringGreen2',
    'SpringGreen3',
    'SpringGreen4',
    'SteelBlue1',
    'SteelBlue2',
    'SteelBlue3',
    'SteelBlue4',
    'Tan1',
    'Tan2',
    'Tan3',
    'Tan4',
    'Thistle1',
    'Thistle2',
    'Thistle3',
    'Thistle4',
    'Tomato1',
    'Tomato2',
    'Tomato3',
    'Tomato4',
    'Turquoise1',
    'Turquoise2',
    'Turquoise3',
    'Turquoise4',
    'VioletRed1',
    'VioletRed2',
    'VioletRed3',
    'VioletRed4',
    'Wheat1',
    'Wheat2',
    'Wheat3',
    'Wheat4',
    'Yellow1',
    'Yellow2',
    'Yellow3',
    'Yellow4',
    'Gray0',
    'Green0',
    'Grey0',
    'Maroon0',
    'Purple0',
  },
}

local log = (function()
  local opts = { verbosity = 0 }

  local function print_message(message, ...)
    print(string.format(message, ...))
  end

  local function info(message, ...)
    if opts.verbosity > 0 then
      print_message(message, ...)
    end
  end

  local function debug(message, ...)
    if opts.verbosity > 1 then
      print_message(message, ...)
    end
  end

  local function verbose(message, ...)
    if opts.verbosity > 2 then
      print_message(message, ...)
    end
  end

  return { opts = opts, info = info, debug = debug, verbose = verbose }
end)()

log.opts.verbosity = 3

local colors = {
  -- base
  black = { 0, 0, 0 },
  blue = { 0, 0, 1 },
  brown = { 0.75, 0.5, 0.25 },
  cyan = { 0, 1, 1 },
  darkgray = { 0.25, 0.25, 0.25 },
  gray = { 0.5, 0.5, 0.5 },
  green = { 0, 1, 0 },
  lightgray = { 0.75, 0.75, 0.75 },
  lime = { 0.75, 1, 0 },
  magenta = { 1, 0, 1 },
  olive = { 0.5, 0.5, 0 },
  orange = { 1, 0.5, 0 },
  pink = { 1, 0.75, 0.75 },
  purple = { 0.75, 0, 0.25 },
  red = { 1, 0, 0 },
  teal = { 0, 0.5, 0.5 },
  violet = { 0.5, 0, 0.5 },
  white = { 1, 1, 1 },
  yellow = { 1, 1, 0 },

  ---svg
  ---
  ---This svg color names are taken from the [xcolor](https://github.com/latex3/xcolor/blob/c5035d41c6070f4e8936196a994ad04336704872/xcolor.dtx#L7134-L7286) package.
  ---https://www.w3.org/TR/2003/REC-SVG11-20030114/types.html#ColorKeywords
  ---https://www.w3.org/TR/css-color-3/#svg-color
  ---
  AliceBlue = { .94, .972, 1 },
  AntiqueWhite = { .98, .92, .844 },
  Aqua = { 0, 1, 1 },
  Aquamarine = { .498, 1, .83 },
  Azure = { .94, 1, 1 },
  Beige = { .96, .96, .864 },
  Bisque = { 1, .894, .77 },
  Black = { 0, 0, 0 },
  BlanchedAlmond = { 1, .92, .804 },
  Blue = { 0, 0, 1 },
  BlueViolet = { .54, .17, .888 },
  Brown = { .648, .165, .165 },
  BurlyWood = { .87, .72, .53 },
  CadetBlue = { .372, .62, .628 },
  Chartreuse = { .498, 1, 0 },
  Chocolate = { .824, .41, .116 },
  Coral = { 1, .498, .312 },
  CornflowerBlue = { .392, .585, .93 },
  Cornsilk = { 1, .972, .864 },
  Crimson = { .864, .08, .235 },
  Cyan = { 0, 1, 1 },
  DarkBlue = { 0, 0, .545 },
  DarkCyan = { 0, .545, .545 },
  DarkGoldenrod = { .72, .525, .044 },
  DarkGray = { .664, .664, .664 },
  DarkGreen = { 0, .392, 0 },
  DarkGrey = { .664, .664, .664 },
  DarkKhaki = { .74, .716, .42 },
  DarkMagenta = { .545, 0, .545 },
  DarkOliveGreen = { .332, .42, .185 },
  DarkOrange = { 1, .55, 0 },
  DarkOrchid = { .6, .196, .8 },
  DarkRed = { .545, 0, 0 },
  DarkSalmon = { .912, .59, .48 },
  DarkSeaGreen = { .56, .736, .56 },
  DarkSlateBlue = { .284, .24, .545 },
  DarkSlateGray = { .185, .31, .31 },
  DarkSlateGrey = { .185, .31, .31 },
  DarkTurquoise = { 0, .808, .82 },
  DarkViolet = { .58, 0, .828 },
  DeepPink = { 1, .08, .576 },
  DeepSkyBlue = { 0, .75, 1 },
  DimGray = { .41, .41, .41 },
  DimGrey = { .41, .41, .41 },
  DodgerBlue = { .116, .565, 1 },
  FireBrick = { .698, .132, .132 },
  FloralWhite = { 1, .98, .94 },
  ForestGreen = { .132, .545, .132 },
  Fuchsia = { 1, 0, 1 },
  Gainsboro = { .864, .864, .864 },
  GhostWhite = { .972, .972, 1 },
  Gold = { 1, .844, 0 },
  Goldenrod = { .855, .648, .125 },
  Gray = { .5, .5, .5 },
  Green = { 0, .5, 0 },
  GreenYellow = { .68, 1, .185 },
  Grey = { .5, .5, .5 },
  Honeydew = { .94, 1, .94 },
  HotPink = { 1, .41, .705 },
  IndianRed = { .804, .36, .36 },
  Indigo = { .294, 0, .51 },
  Ivory = { 1, 1, .94 },
  Khaki = { .94, .9, .55 },
  Lavender = { .9, .9, .98 },
  LavenderBlush = { 1, .94, .96 },
  LawnGreen = { .488, .99, 0 },
  LemonChiffon = { 1, .98, .804 },
  LightBlue = { .68, .848, .9 },
  LightCoral = { .94, .5, .5 },
  LightCyan = { .88, 1, 1 },
  LightGoldenrod = { .933, .867, .51 }, -- Colors taken from Unix/X11
  LightGoldenrodYellow = { .98, .98, .824 },
  LightGray = { .828, .828, .828 },
  LightGreen = { .565, .932, .565 },
  LightGrey = { .828, .828, .828 },
  LightPink = { 1, .712, .756 },
  LightSalmon = { 1, .628, .48 },
  LightSeaGreen = { .125, .698, .668 },
  LightSkyBlue = { .53, .808, .98 },
  LightSlateBlue = { .518, .44, 1 }, -- Colors taken from Unix/X11
  LightSlateGray = { .468, .532, .6 },
  LightSlateGrey = { .468, .532, .6 },
  LightSteelBlue = { .69, .77, .87 },
  LightYellow = { 1, 1, .88 },
  Lime = { 0, 1, 0 },
  LimeGreen = { .196, .804, .196 },
  Linen = { .98, .94, .9 },
  Magenta = { 1, 0, 1 },
  Maroon = { .5, 0, 0 },
  MediumAquamarine = { .4, .804, .668 },
  MediumBlue = { 0, 0, .804 },
  MediumOrchid = { .73, .332, .828 },
  MediumPurple = { .576, .44, .86 },
  MediumSeaGreen = { .235, .7, .444 },
  MediumSlateBlue = { .484, .408, .932 },
  MediumSpringGreen = { 0, .98, .604 },
  MediumTurquoise = { .284, .82, .8 },
  MediumVioletRed = { .78, .084, .52 },
  MidnightBlue = { .098, .098, .44 },
  MintCream = { .96, 1, .98 },
  MistyRose = { 1, .894, .884 },
  Moccasin = { 1, .894, .71 },
  NavajoWhite = { 1, .87, .68 },
  Navy = { 0, 0, .5 },
  NavyBlue = { 0, 0, .5 }, -- Colors taken from Unix/X11
  OldLace = { .992, .96, .9 },
  Olive = { .5, .5, 0 },
  OliveDrab = { .42, .556, .136 },
  Orange = { 1, .648, 0 },
  OrangeRed = { 1, .27, 0 },
  Orchid = { .855, .44, .84 },
  PaleGoldenrod = { .932, .91, .668 },
  PaleGreen = { .596, .985, .596 },
  PaleTurquoise = { .688, .932, .932 },
  PaleVioletRed = { .86, .44, .576 },
  PapayaWhip = { 1, .936, .835 },
  PeachPuff = { 1, .855, .725 },
  Peru = { .804, .52, .248 },
  Pink = { 1, .752, .796 },
  Plum = { .868, .628, .868 },
  PowderBlue = { .69, .88, .9 },
  Purple = { .5, 0, .5 },
  Red = { 1, 0, 0 },
  RosyBrown = { .736, .56, .56 },
  RoyalBlue = { .255, .41, .884 },
  SaddleBrown = { .545, .27, .075 },
  Salmon = { .98, .5, .448 },
  SandyBrown = { .956, .644, .376 },
  SeaGreen = { .18, .545, .34 },
  Seashell = { 1, .96, .932 },
  Sienna = { .628, .32, .176 },
  Silver = { .752, .752, .752 },
  SkyBlue = { .53, .808, .92 },
  SlateBlue = { .415, .352, .804 },
  SlateGray = { .44, .5, .565 },
  SlateGrey = { .44, .5, .565 },
  Snow = { 1, .98, .98 },
  SpringGreen = { 0, 1, .498 },
  SteelBlue = { .275, .51, .705 },
  Tan = { .824, .705, .55 },
  Teal = { 0, .5, .5 },
  Thistle = { .848, .75, .848 },
  Tomato = { 1, .39, .28 },
  Turquoise = { .25, .88, .815 },
  Violet = { .932, .51, .932 },
  VioletRed = { .816, .125, .565 }, -- Colors taken from Unix/X11
  Wheat = { .96, .87, .7 },
  White = { 1, 1, 1 },
  WhiteSmoke = { .96, .96, .96 },
  Yellow = { 1, 1, 0 },
  YellowGreen = { .604, .804, .196 },

  ---x11
  ---
  ---This x11 color names are taken from the [xcolor](https://github.com/latex3/xcolor/blob/c5035d41c6070f4e8936196a994ad04336704872/xcolor.dtx#L7289-L7607) package.
  ---https://en.wikipedia.org/wiki/X11_color_names
  ---https://gitlab.freedesktop.org/xorg/app/rgb/raw/master/rgb.txt
  AntiqueWhite1 = { 1, .936, .86 },
  AntiqueWhite2 = { .932, .875, .8 },
  AntiqueWhite3 = { .804, .752, .69 },
  AntiqueWhite4 = { .545, .512, .47 },
  Aquamarine1 = { .498, 1, .83 },
  Aquamarine2 = { .464, .932, .776 },
  Aquamarine3 = { .4, .804, .668 },
  Aquamarine4 = { .27, .545, .455 },
  Azure1 = { .94, 1, 1 },
  Azure2 = { .88, .932, .932 },
  Azure3 = { .756, .804, .804 },
  Azure4 = { .512, .545, .545 },
  Bisque1 = { 1, .894, .77 },
  Bisque2 = { .932, .835, .716 },
  Bisque3 = { .804, .716, .62 },
  Bisque4 = { .545, .49, .42 },
  Blue1 = { 0, 0, 1 },
  Blue2 = { 0, 0, .932 },
  Blue3 = { 0, 0, .804 },
  Blue4 = { 0, 0, .545 },
  Brown1 = { 1, .25, .25 },
  Brown2 = { .932, .23, .23 },
  Brown3 = { .804, .2, .2 },
  Brown4 = { .545, .136, .136 },
  Burlywood1 = { 1, .828, .608 },
  Burlywood2 = { .932, .772, .57 },
  Burlywood3 = { .804, .668, .49 },
  Burlywood4 = { .545, .45, .332 },
  CadetBlue1 = { .596, .96, 1 },
  CadetBlue2 = { .556, .898, .932 },
  CadetBlue3 = { .48, .772, .804 },
  CadetBlue4 = { .325, .525, .545 },
  Chartreuse1 = { .498, 1, 0 },
  Chartreuse2 = { .464, .932, 0 },
  Chartreuse3 = { .4, .804, 0 },
  Chartreuse4 = { .27, .545, 0 },
  Chocolate1 = { 1, .498, .14 },
  Chocolate2 = { .932, .464, .13 },
  Chocolate3 = { .804, .4, .112 },
  Chocolate4 = { .545, .27, .075 },
  Coral1 = { 1, .448, .336 },
  Coral2 = { .932, .415, .312 },
  Coral3 = { .804, .356, .27 },
  Coral4 = { .545, .244, .185 },
  Cornsilk1 = { 1, .972, .864 },
  Cornsilk2 = { .932, .91, .804 },
  Cornsilk3 = { .804, .785, .694 },
  Cornsilk4 = { .545, .532, .47 },
  Cyan1 = { 0, 1, 1 },
  Cyan2 = { 0, .932, .932 },
  Cyan3 = { 0, .804, .804 },
  Cyan4 = { 0, .545, .545 },
  DarkGoldenrod1 = { 1, .725, .06 },
  DarkGoldenrod2 = { .932, .68, .055 },
  DarkGoldenrod3 = { .804, .585, .048 },
  DarkGoldenrod4 = { .545, .396, .03 },
  DarkOliveGreen1 = { .792, 1, .44 },
  DarkOliveGreen2 = { .736, .932, .408 },
  DarkOliveGreen3 = { .635, .804, .352 },
  DarkOliveGreen4 = { .43, .545, .24 },
  DarkOrange1 = { 1, .498, 0 },
  DarkOrange2 = { .932, .464, 0 },
  DarkOrange3 = { .804, .4, 0 },
  DarkOrange4 = { .545, .27, 0 },
  DarkOrchid1 = { .75, .244, 1 },
  DarkOrchid2 = { .698, .228, .932 },
  DarkOrchid3 = { .604, .196, .804 },
  DarkOrchid4 = { .408, .132, .545 },
  DarkSeaGreen1 = { .756, 1, .756 },
  DarkSeaGreen2 = { .705, .932, .705 },
  DarkSeaGreen3 = { .608, .804, .608 },
  DarkSeaGreen4 = { .41, .545, .41 },
  DarkSlateGray1 = { .592, 1, 1 },
  DarkSlateGray2 = { .552, .932, .932 },
  DarkSlateGray3 = { .475, .804, .804 },
  DarkSlateGray4 = { .32, .545, .545 },
  DeepPink1 = { 1, .08, .576 },
  DeepPink2 = { .932, .07, .536 },
  DeepPink3 = { .804, .064, .464 },
  DeepPink4 = { .545, .04, .312 },
  DeepSkyBlue1 = { 0, .75, 1 },
  DeepSkyBlue2 = { 0, .698, .932 },
  DeepSkyBlue3 = { 0, .604, .804 },
  DeepSkyBlue4 = { 0, .408, .545 },
  DodgerBlue1 = { .116, .565, 1 },
  DodgerBlue2 = { .11, .525, .932 },
  DodgerBlue3 = { .094, .455, .804 },
  DodgerBlue4 = { .064, .305, .545 },
  Firebrick1 = { 1, .19, .19 },
  Firebrick2 = { .932, .172, .172 },
  Firebrick3 = { .804, .15, .15 },
  Firebrick4 = { .545, .1, .1 },
  Gold1 = { 1, .844, 0 },
  Gold2 = { .932, .79, 0 },
  Gold3 = { .804, .68, 0 },
  Gold4 = { .545, .46, 0 },
  Goldenrod1 = { 1, .756, .145 },
  Goldenrod2 = { .932, .705, .132 },
  Goldenrod3 = { .804, .608, .112 },
  Goldenrod4 = { .545, .41, .08 },
  Green1 = { 0, 1, 0 },
  Green2 = { 0, .932, 0 },
  Green3 = { 0, .804, 0 },
  Green4 = { 0, .545, 0 },
  Honeydew1 = { .94, 1, .94 },
  Honeydew2 = { .88, .932, .88 },
  Honeydew3 = { .756, .804, .756 },
  Honeydew4 = { .512, .545, .512 },
  HotPink1 = { 1, .43, .705 },
  HotPink2 = { .932, .415, .655 },
  HotPink3 = { .804, .376, .565 },
  HotPink4 = { .545, .228, .385 },
  IndianRed1 = { 1, .415, .415 },
  IndianRed2 = { .932, .39, .39 },
  IndianRed3 = { .804, .332, .332 },
  IndianRed4 = { .545, .228, .228 },
  Ivory1 = { 1, 1, .94 },
  Ivory2 = { .932, .932, .88 },
  Ivory3 = { .804, .804, .756 },
  Ivory4 = { .545, .545, .512 },
  Khaki1 = { 1, .965, .56 },
  Khaki2 = { .932, .9, .52 },
  Khaki3 = { .804, .776, .45 },
  Khaki4 = { .545, .525, .305 },
  LavenderBlush1 = { 1, .94, .96 },
  LavenderBlush2 = { .932, .88, .898 },
  LavenderBlush3 = { .804, .756, .772 },
  LavenderBlush4 = { .545, .512, .525 },
  LemonChiffon1 = { 1, .98, .804 },
  LemonChiffon2 = { .932, .912, .75 },
  LemonChiffon3 = { .804, .79, .648 },
  LemonChiffon4 = { .545, .536, .44 },
  LightBlue1 = { .75, .936, 1 },
  LightBlue2 = { .698, .875, .932 },
  LightBlue3 = { .604, .752, .804 },
  LightBlue4 = { .408, .512, .545 },
  LightCyan1 = { .88, 1, 1 },
  LightCyan2 = { .82, .932, .932 },
  LightCyan3 = { .705, .804, .804 },
  LightCyan4 = { .48, .545, .545 },
  LightGoldenrod1 = { 1, .925, .545 },
  LightGoldenrod2 = { .932, .864, .51 },
  LightGoldenrod3 = { .804, .745, .44 },
  LightGoldenrod4 = { .545, .505, .298 },
  LightPink1 = { 1, .684, .725 },
  LightPink2 = { .932, .635, .68 },
  LightPink3 = { .804, .55, .585 },
  LightPink4 = { .545, .372, .396 },
  LightSalmon1 = { 1, .628, .48 },
  LightSalmon2 = { .932, .585, .448 },
  LightSalmon3 = { .804, .505, .385 },
  LightSalmon4 = { .545, .34, .26 },
  LightSkyBlue1 = { .69, .888, 1 },
  LightSkyBlue2 = { .644, .828, .932 },
  LightSkyBlue3 = { .552, .712, .804 },
  LightSkyBlue4 = { .376, .484, .545 },
  LightSteelBlue1 = { .792, .884, 1 },
  LightSteelBlue2 = { .736, .824, .932 },
  LightSteelBlue3 = { .635, .71, .804 },
  LightSteelBlue4 = { .43, .484, .545 },
  LightYellow1 = { 1, 1, .88 },
  LightYellow2 = { .932, .932, .82 },
  LightYellow3 = { .804, .804, .705 },
  LightYellow4 = { .545, .545, .48 },
  Magenta1 = { 1, 0, 1 },
  Magenta2 = { .932, 0, .932 },
  Magenta3 = { .804, 0, .804 },
  Magenta4 = { .545, 0, .545 },
  Maroon1 = { 1, .204, .7 },
  Maroon2 = { .932, .19, .655 },
  Maroon3 = { .804, .16, .565 },
  Maroon4 = { .545, .11, .385 },
  MediumOrchid1 = { .88, .4, 1 },
  MediumOrchid2 = { .82, .372, .932 },
  MediumOrchid3 = { .705, .32, .804 },
  MediumOrchid4 = { .48, .215, .545 },
  MediumPurple1 = { .67, .51, 1 },
  MediumPurple2 = { .624, .475, .932 },
  MediumPurple3 = { .536, .408, .804 },
  MediumPurple4 = { .365, .28, .545 },
  MistyRose1 = { 1, .894, .884 },
  MistyRose2 = { .932, .835, .824 },
  MistyRose3 = { .804, .716, .71 },
  MistyRose4 = { .545, .49, .484 },
  NavajoWhite1 = { 1, .87, .68 },
  NavajoWhite2 = { .932, .81, .63 },
  NavajoWhite3 = { .804, .7, .545 },
  NavajoWhite4 = { .545, .475, .37 },
  OliveDrab1 = { .752, 1, .244 },
  OliveDrab2 = { .7, .932, .228 },
  OliveDrab3 = { .604, .804, .196 },
  OliveDrab4 = { .41, .545, .132 },
  Orange1 = { 1, .648, 0 },
  Orange2 = { .932, .604, 0 },
  Orange3 = { .804, .52, 0 },
  Orange4 = { .545, .352, 0 },
  OrangeRed1 = { 1, .27, 0 },
  OrangeRed2 = { .932, .25, 0 },
  OrangeRed3 = { .804, .215, 0 },
  OrangeRed4 = { .545, .145, 0 },
  Orchid1 = { 1, .512, .98 },
  Orchid2 = { .932, .48, .912 },
  Orchid3 = { .804, .41, .79 },
  Orchid4 = { .545, .28, .536 },
  PaleGreen1 = { .604, 1, .604 },
  PaleGreen2 = { .565, .932, .565 },
  PaleGreen3 = { .488, .804, .488 },
  PaleGreen4 = { .33, .545, .33 },
  PaleTurquoise1 = { .732, 1, 1 },
  PaleTurquoise2 = { .684, .932, .932 },
  PaleTurquoise3 = { .59, .804, .804 },
  PaleTurquoise4 = { .4, .545, .545 },
  PaleVioletRed1 = { 1, .51, .67 },
  PaleVioletRed2 = { .932, .475, .624 },
  PaleVioletRed3 = { .804, .408, .536 },
  PaleVioletRed4 = { .545, .28, .365 },
  PeachPuff1 = { 1, .855, .725 },
  PeachPuff2 = { .932, .796, .68 },
  PeachPuff3 = { .804, .688, .585 },
  PeachPuff4 = { .545, .468, .396 },
  Pink1 = { 1, .71, .772 },
  Pink2 = { .932, .664, .72 },
  Pink3 = { .804, .57, .62 },
  Pink4 = { .545, .39, .424 },
  Plum1 = { 1, .732, 1 },
  Plum2 = { .932, .684, .932 },
  Plum3 = { .804, .59, .804 },
  Plum4 = { .545, .4, .545 },
  Purple1 = { .608, .19, 1 },
  Purple2 = { .57, .172, .932 },
  Purple3 = { .49, .15, .804 },
  Purple4 = { .332, .1, .545 },
  Red1 = { 1, 0, 0 },
  Red2 = { .932, 0, 0 },
  Red3 = { .804, 0, 0 },
  Red4 = { .545, 0, 0 },
  RosyBrown1 = { 1, .756, .756 },
  RosyBrown2 = { .932, .705, .705 },
  RosyBrown3 = { .804, .608, .608 },
  RosyBrown4 = { .545, .41, .41 },
  RoyalBlue1 = { .284, .464, 1 },
  RoyalBlue2 = { .264, .43, .932 },
  RoyalBlue3 = { .228, .372, .804 },
  RoyalBlue4 = { .152, .25, .545 },
  Salmon1 = { 1, .55, .41 },
  Salmon2 = { .932, .51, .385 },
  Salmon3 = { .804, .44, .33 },
  Salmon4 = { .545, .298, .224 },
  SeaGreen1 = { .33, 1, .624 },
  SeaGreen2 = { .305, .932, .58 },
  SeaGreen3 = { .264, .804, .5 },
  SeaGreen4 = { .18, .545, .34 },
  Seashell1 = { 1, .96, .932 },
  Seashell2 = { .932, .898, .87 },
  Seashell3 = { .804, .772, .75 },
  Seashell4 = { .545, .525, .51 },
  Sienna1 = { 1, .51, .28 },
  Sienna2 = { .932, .475, .26 },
  Sienna3 = { .804, .408, .224 },
  Sienna4 = { .545, .28, .15 },
  SkyBlue1 = { .53, .808, 1 },
  SkyBlue2 = { .494, .752, .932 },
  SkyBlue3 = { .424, .65, .804 },
  SkyBlue4 = { .29, .44, .545 },
  SlateBlue1 = { .512, .435, 1 },
  SlateBlue2 = { .48, .404, .932 },
  SlateBlue3 = { .41, .35, .804 },
  SlateBlue4 = { .28, .235, .545 },
  SlateGray1 = { .776, .888, 1 },
  SlateGray2 = { .725, .828, .932 },
  SlateGray3 = { .624, .712, .804 },
  SlateGray4 = { .424, .484, .545 },
  Snow1 = { 1, .98, .98 },
  Snow2 = { .932, .912, .912 },
  Snow3 = { .804, .79, .79 },
  Snow4 = { .545, .536, .536 },
  SpringGreen1 = { 0, 1, .498 },
  SpringGreen2 = { 0, .932, .464 },
  SpringGreen3 = { 0, .804, .4 },
  SpringGreen4 = { 0, .545, .27 },
  SteelBlue1 = { .39, .72, 1 },
  SteelBlue2 = { .36, .675, .932 },
  SteelBlue3 = { .31, .58, .804 },
  SteelBlue4 = { .21, .392, .545 },
  Tan1 = { 1, .648, .31 },
  Tan2 = { .932, .604, .288 },
  Tan3 = { .804, .52, .248 },
  Tan4 = { .545, .352, .17 },
  Thistle1 = { 1, .884, 1 },
  Thistle2 = { .932, .824, .932 },
  Thistle3 = { .804, .71, .804 },
  Thistle4 = { .545, .484, .545 },
  Tomato1 = { 1, .39, .28 },
  Tomato2 = { .932, .36, .26 },
  Tomato3 = { .804, .31, .224 },
  Tomato4 = { .545, .21, .15 },
  Turquoise1 = { 0, .96, 1 },
  Turquoise2 = { 0, .898, .932 },
  Turquoise3 = { 0, .772, .804 },
  Turquoise4 = { 0, .525, .545 },
  VioletRed1 = { 1, .244, .59 },
  VioletRed2 = { .932, .228, .55 },
  VioletRed3 = { .804, .196, .47 },
  VioletRed4 = { .545, .132, .32 },
  Wheat1 = { 1, .905, .73 },
  Wheat2 = { .932, .848, .684 },
  Wheat3 = { .804, .73, .59 },
  Wheat4 = { .545, .494, .4 },
  Yellow1 = { 1, 1, 0 },
  Yellow2 = { .932, .932, 0 },
  Yellow3 = { .804, .804, 0 },
  Yellow4 = { .545, .545, 0 },
  Gray0 = { .745, .745, .745 },
  Green0 = { 0, 1, 0 },
  Grey0 = { .745, .745, .745 },
  Maroon0 = { .69, .19, .376 },
  Purple0 = { .628, .125, .94 },
}

--- https://luarocks.org/modules/Firanel/lua-color
--- Copyright (c) 2021 Firanel

---https://github.com/Firanel/lua-color/blob/master/util/bitwise.lua
local bitwise = (function()
  -- Implementations of bitwise operators so that lua-color can be used
  -- with Lua 5.1 and LuaJIT 2.1.0-beta3 (e.g. inside Neovim).

  -- Code taken directly from:
  -- https://stackoverflow.com/questions/5977654/how-do-i-use-the-bitwise-operator-xor-in-lua

  local function bit_xor(a, b)
    local p, c = 1, 0
    while a > 0 and b > 0 do
      local ra, rb = a % 2, b % 2
      if ra ~= rb then
        c = c + p
      end
      a, b, p = (a - ra) / 2, (b - rb) / 2, p * 2
    end
    if a < b then
      a = b
    end
    while a > 0 do
      local ra = a % 2
      if ra > 0 then
        c = c + p
      end
      a, p = (a - ra) / 2, p * 2
    end
    return c
  end

  local function bit_or(a, b)
    local p, c = 1, 0
    while a + b > 0 do
      local ra, rb = a % 2, b % 2
      if ra + rb > 0 then
        c = c + p
      end
      a, b, p = (a - ra) / 2, (b - rb) / 2, p * 2
    end
    return c
  end

  local function bit_not(n)
    local p, c = 1, 0
    while n > 0 do
      local r = n % 2
      if r < 1 then
        c = c + p
      end
      n, p = (n - r) / 2, p * 2
    end
    return c
  end

  local function bit_and(a, b)
    local p, c = 1, 0
    while a > 0 and b > 0 do
      local ra, rb = a % 2, b % 2
      if ra + rb > 1 then
        c = c + p
      end
      a, b, p = (a - ra) / 2, (b - rb) / 2, p * 2
    end
    return c
  end

  local function bit_lshift(x, by)
    return x * 2 ^ by
  end

  local function bit_rshift(x, by)
    return math.floor(x / 2 ^ by)
  end

  return {
    bit_xor = bit_xor,
    bit_or = bit_or,
    bit_not = bit_not,
    bit_and = bit_and,
    bit_lshift = bit_lshift,
    bit_rshift = bit_rshift,
  }
end)()

--- https://github.com/Firanel/lua-color/blob/master/util/class.lua
local class = (function()

  -- Code based on:
  -- http://lua-users.org/wiki/SimpleLuaClasses

  ---Helper function to create classes
  ---
  ---@usage local Color = class(function () --[[ constructor ]] end)
  ---@usage local Color2 = class(
  --   Color,
  --   function () --[[ constructor ]] end,
  --   { prop_a = "some value" }
  -- )
  local function class(base, init, defaults)
    local c = defaults or {} -- a new class instance
    if not init and type(base) == 'function' then
      init = base
      base = nil
    elseif type(base) == 'table' then
      -- our new class is a shallow copy of the base class!
      for i, v in pairs(base) do
        c[i] = v
      end
      c._base = base
    end
    -- the class will be the metatable for all its objects,
    -- and they will look up their methods in it.
    c.__index = c

    -- expose a constructor which can be called by <classname>(<args>)
    local mt = {}
    mt.__call = function(class_tbl, ...)
      local obj = {}
      setmetatable(obj, c)
      if init then
        init(obj, ...)
      else
        -- make sure that any stuff from the base class is initialized!
        if base and base.init then
          base.init(obj, ...)
        end
      end
      return obj
    end
    c.init = init
    c.is_a = function(self, klass)
      local m = getmetatable(self)
      while m do
        if m == klass then
          return true
        end
        m = m._base
      end
      return false
    end
    setmetatable(c, mt)
    return c
  end

  return class
end)()

---https://github.com/Firanel/lua-color/blob/master/utils/init.lua
local utils = (function()
  local function min_ind(first, ...)
    local min, ind = first, 1
    for i, v in ipairs { ... } do
      if v < min then
        min, ind = v, i + 1
      end
    end
    return min, ind
  end

  local function max_ind(first, ...)
    local max, ind = first, 1
    for i, v in ipairs { ... } do
      if v > max then
        max, ind = v, i + 1
      end
    end
    return max, ind
  end

  local function round(x)
    return x + 0.5 - (x + 0.5) % 1
  end

  local function clamp(x, min, max)
    return x < min and min or x > max and max or x
  end

  local function map(t, cb)
    local n = {}
    for i, v in ipairs(t) do
      n[i] = cb(v)
    end
    return n
  end

  return {
    min = min_ind,
    max = max_ind,
    round = round,
    clamp = clamp,
    map = map,
  }
end)()

---Source: [texmf-dist/tex/context/base/mkiv/attr-col.lua](https://git.texlive.info/texlive/tree/Master/texmf-dist/tex/context/base/mkiv/attr-col.lua)
local convert = (function()

  ---
  ---https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
  ---https://www.101computing.net/cmyk-to-rgb-conversion-algorithm/
  ---
  ---@param r r # red (0.0 - 1.0)
  ---@param g g # green (0.0 - 1.0)
  ---@param b b # blue (0.0 - 1.0)
  ---
  ---@return c c # cyan (0.0 - 1.0)
  ---@return m m # magenta (0.0 - 1.0)
  ---@return y y # yellow (0.0 - 1.0)
  ---@return k k # key(black) (0.0 - 1.0)
  local function rgb_to_cmyk(r, g, b)
    local K = math.max(r, g, b)
    if K == 0 then
      return 0.0, 0.0, 0.0, 1.0
    end
    local k = 1 - K
    local c = (K - r) / K
    local m = (K - g) / K
    local y = (K - b) / K
    return c, m, y, k
  end

  ---https://www.rapidtables.com/convert/color/cmyk-to-rgb.html
  local function cmyk_to_rgb(c, m, y, k)
    if not k then
      k = 0
    end
    ---texmf-dist/tex/context/base/mkiv/attr-col.lua
    -- local d = 1.0 - k
    -- local r = 1.0 - math.min(1.0, c * d + k)
    -- local g = 1.0 - math.min(1.0, m * d + k)
    -- local b = 1.0 - math.min(1.0, y * d + k)

    ---texmf-dist/tex/context/base/mkiv/attr-col.lua
    -- local r = 1.0 - math.min(1.0, c + k)
    -- local g = 1.0 - math.min(1.0, m + k)
    -- local b = 1.0 - math.min(1.0, y + k)

    ---https://github.com/Firanel/lua-color/blob/eba73e53e9abd2e8da4d56b016fd77b45c2f3b79/init.lua#L335-L340
    local K = 1 - k
    local r = (1 - c) * K
    local g = (1 - m) * K
    local b = (1 - y) * K

    return r, g, b

  end

  local function rgb_to_gray(r, g, b)
    if not r then
      return 0
    end
    local w = colors.weightgray
    if w == true then
      return .30 * r + .59 * g + .11 * b
    elseif not w then
      return r / 3 + g / 3 + b / 3
    else
      return w[1] * r + w[2] * g + w[3] * b
    end
  end

  local function cmyk_to_gray(c, m, y, k)
    return rgb_to_gray(cmyk_to_rgb(c, m, y, k))
  end

  -- http://en.wikipedia.org/wiki/HSI_color_space
  -- http://nl.wikipedia.org/wiki/HSV_(kleurruimte)

  -- 	h /= 60;        // sector 0 to 5
  -- 	i = floor( h );
  -- 	f = h - i;      // factorial part of h

  local function hsv_to_rgb(h, s, v)
    if s > 1 then
      s = 1
    elseif s < 0 then
      s = 0
    elseif s == 0 then
      return v, v, v
    end
    if v > 1 then
      s = 1
    elseif v < 0 then
      v = 0
    end
    if h < 0 then
      h = 0
    elseif h >= 360 then
      h = mod(h, 360)
    end
    local hd = h / 60
    local hi = floor(hd)
    local f = hd - hi
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    if hi == 0 then
      return v, t, p
    elseif hi == 1 then
      return q, v, p
    elseif hi == 2 then
      return p, v, t
    elseif hi == 3 then
      return p, q, v
    elseif hi == 4 then
      return t, p, v
    elseif hi == 5 then
      return v, p, q
    else
      print('error in hsv -> rgb', h, s, v)
      return 0, 0, 0
    end
  end

  local function rgb_to_hsv(r, g, b)
    local offset, maximum, other_1, other_2
    if r >= g and r >= b then
      offset, maximum, other_1, other_2 = 0, r, g, b
    elseif g >= r and g >= b then
      offset, maximum, other_1, other_2 = 2, g, b, r
    else
      offset, maximum, other_1, other_2 = 4, b, r, g
    end
    if maximum == 0 then
      return 0, 0, 0
    end
    local minimum = other_1 < other_2 and other_1 or other_2
    if maximum == minimum then
      return 0, 0, maximum
    end
    local delta = maximum - minimum
    return (offset + (other_1 - other_2) / delta) * 60, delta / maximum,
      maximum
  end

  local function gray_to_rgb(s) -- unweighted
    return 1 - s, 1 - s, 1 - s
  end

  local function hsv_to_gray(h, s, v)
    return rgb_to_gray(hsv_to_rgb(h, s, v))
  end

  local function gray_to_hsv(s)
    return 0, 0, s
  end

  ---
  ---@param h any # hue
  ---@param black any # black
  ---@param white any # white
  ---
  ---@return number r
  ---@return number g
  ---@return number b
  local function hwb_to_rgb(h, black, white)
    local r, g, b = hsv_to_rgb(h, 1, .5)
    local f = 1 - white - black
    return f * r + white, f * g + white, f * b + white
  end

  return {
    rgb_to_cmyk = rgb_to_cmyk,
    cmyk_to_rgb = cmyk_to_rgb,
    rgb_to_gray = rgb_to_gray,
    cmyk_to_gray = cmyk_to_gray,
    hsv_to_rgb = hsv_to_rgb,
    rgb_to_hsv = rgb_to_hsv,
    gray_to_rgb = gray_to_rgb,
    hsv_to_gray = hsv_to_gray,
    gray_to_hsv = gray_to_hsv,
    hwb_to_rgb = hwb_to_rgb,
  }

end)()

--- https://github.com/Firanel/lua-color/blob/master/init.lua

---The Class Color is the main class of the submodule. It represents a
---RGB color.
---
---@class Color
---@field r number # Red component.
---@field g number # Green component.
---@field b number # Blue component.
---@field a number # Alpha component.
---
---@function Color:__call
---
---@param value Color string|table|Color value (default: `nil`)
---
---@see Color:set
local Color = (function()

  ---Parse, convert and manipulate color values.
  ---
  -- @classmod Color

  -- Lua 5.1 compat
  local bit_and = bitwise.bit_and
  local bit_lshift = bitwise.bit_lshift
  local bit_rshift = bitwise.bit_rshift

  -- Utils

  local function hcm_to_rgb(h, c, m)
    local r, g, b = 0, 0, 0

    h = h * 6
    local x = c * (1 - math.abs(h % 2 - 1))

    if h <= 1 then
      r, g, b = c, x, 0
    elseif h <= 2 then
      r, g, b = x, c, 0
    elseif h <= 3 then
      r, g, b = 0, c, x
    elseif h <= 4 then
      r, g, b = 0, x, c
    elseif h <= 5 then
      r, g, b = x, 0, c
    elseif h <= 6 then
      r, g, b = c, 0, x
    end

    return r + m, g + m, b + m
  end

  ---
  ---@param str string A number encoded as a string with an optional percent sign.
  ---
  ---@return number result A number from 0 - 1
  local function tonumPercent(str)
    if str:sub(-1) == '%' then
      return tonumber(str:sub(1, #str - 1)) / 100
    end
    return tonumber(str)
  end

  -- Color

  ---Color constructor.
  ---
  -- @function Color:__call
  ---
  ---@param ?string|table|Color value Color value (default: `nil`)
  ---
  ---@see Color:set

  ---Red component.
  -- @field r

  ---Green component.
  -- @field g

  ---Blue component.
  -- @field b

  ---Alpha component.
  -- @field a

  ---Color class
  local Color = class(nil, function(this, value)
    if value then
      if type(value) == 'string' then
        -- # gets expanded to ##
        value = string.gsub(value, '^##', '#')
      end
      this:set(value)
    end
  end, { __is_color = true, r = 0, g = 0, b = 0, a = 1 })

  ---Clone color
  ---
  ---@return Color copy
  function Color:clone()
    return Color(self)
  end

  ---Set color to value.
  -- <br>
  -- Called by constructor
  -- <br><br>
  -- Possible value types:
  -- <ul>
  --  <li>`Color`</li>
  --  <li>color name as specified in `Color.colorNames`</li>
  --  <li>css style functions as string:<ul>
  --   <li>`rgb(r, g, b)`</li>
  --   <li>`rgba(r, g, b, a)`</li>
  --   <li>`hsl(h, s, l)`</li>
  --   <li>`hsla(h, s, l, a)`</li>
  --   <li>`hsv(h, s, v)`</li>
  --   <li>`hsva(h, s, v, a)`</li>
  --   <li>`hwb(h, w, b)`</li>
  --   <li>`hwba(h, w, b, a)`</li>
  --   <li>`cmyk(c, m, y, k)`</li>
  --   </ul>
  --   Values are in the same ranges as in css ([0;255] for rgb, [0;1] for alpha, ...)<br>
  --   functions can be specified in a simplified syntax: `rgb(r, g, b) == rgb r g b`
  --  </li>
  --  <li>NCol string: `R10, 50%, 50%`</li>
  --  <li>hex string: `#rgb` | `#rgba` | `#rrggbb` | `#rrggbbaa` (`#` can be omitted)</li>
  --  <li>rgb values in [0;1]: `{r, g, b[, a]}` | `{r=r, g=g, b=b[, a=a]}`</li>
  --  <li>hsv values in [0;1]: `{h=h, s=s, v=v[, a=a]}`</li>
  --  <li>hsl values in [0;1]: `{h=h, s=s, l=l[, a=a]}`</li>
  --  <li>hwb values in [0;1]: `{h=h, w=w, b=b[, a=a]}`</li>
  --  <li>cmyk values in [0;1]: `{c=c, m=m, y=y, k=k}`</li>
  --  <li>single set mode, table with any combination of the following: <ul>
  --   <li>`red`</li>
  --   <li>`green`</li>
  --   <li>`blue`</li>
  --   <li>`alpha`</li>
  --   <li>`hue`</li>
  --   <li>`saturation`</li>
  --   <li>`value`</li>
  --   <li>`lightness`</li>
  --   <li>`whiteness`</li>
  --   <li>`blackness`</li>
  --   <li>`cyan`</li>
  --   <li>`magenta`</li>
  --   <li>`yellow`</li>
  --   <li>`key`</li>
  --   </ul>
  --   All values are in `[0;1]`.<br>
  --   They will be applied in the order: `rgba -> hsl -> hwb -> hsv -> cmyk`<br>
  --   If `lightness` is given, saturation is treated as hsl saturation,
  --   otherwise it will be treated as hsv saturation.
  --  </li>
  -- </ul>
  ---
  ---@see Color:__call
  ---
  ---@param value string|table|Color
  ---
  ---@return Color self
  ---
  ---@usage color:set "#f1f1f1"
  ---@usage color:set "rgba(241, 241, 241, 0.5)"
  ---@usage color:set "hsl 180 100% 20%"
  ---@usage color:set { r = 0.255, g = 0.729, b = 0.412 }
  ---@usage color:set { 0.255, 0.729, 0.412 } -- same as above
  ---@usage color:set { h = 0.389, s = 0.65, v = 0.73 }
  function Color:set(value)
    assert(value)

    -- from Color
    if value.__is_color then
      self.r = value.r
      self.g = value.g
      self.b = value.b
      self.a = value.a

    elseif type(value) == 'string' then
      self.a = 1

      if value:sub(1, 1) ~= '#' then
        local c = colors[value]
        if c then
          self.r = c[1]
          self.g = c[2]
          self.b = c[3]
          return
        end

        local func, values = value:match '(%w+)[ %(]+([x ,.%x%%]+)'
        if func ~= nil then
          if func == 'rgb' then
            local r, g, b =
              values:match '([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+)'
            assert(r and g and b)
            self.r = tonumber(r) / 0xff
            self.g = tonumber(g) / 0xff
            self.b = tonumber(b) / 0xff
            return self
          elseif func == 'rgba' then
            local r, g, b, a =
              values:match '([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+%%?)'
            assert(r and g and b and a)
            self.r = tonumber(r) / 0xff
            self.g = tonumber(g) / 0xff
            self.b = tonumber(b) / 0xff
            self.a = tonumPercent(a)
            return self
          elseif func == 'hsv' then
            local h, s, v =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and s and v)
            return self:set{
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              v = tonumPercent(v),
            }
          elseif func == 'hsva' then
            local h, s, v, a =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and s and v and a)
            return self:set{
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              v = tonumPercent(v),
              a = tonumPercent(a),
            }
          elseif func == 'hsl' then
            local h, s, l =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and s and l)
            return self:set{
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              l = tonumPercent(l),
            }
          elseif func == 'hsla' then
            local h, s, l, a =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and s and l and a)
            return self:set{
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              l = tonumPercent(l),
              a = tonumPercent(a),
            }
          elseif func == 'hwb' then
            local h, w, b =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and w and b)
            return self:set{
              h = tonumber(h) / 360,
              w = tonumPercent(w),
              b = tonumPercent(b),
            }
          elseif func == 'hwba' then
            local h, w, b, a =
              values:match '([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(h and w and b and a)
            return self:set{
              h = tonumber(h) / 360,
              w = tonumPercent(w),
              b = tonumPercent(b),
              a = tonumPercent(a),
            }
          elseif func == 'cmyk' then
            local c, m, y, k =
              values:match '([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
            assert(c and m and y and k)
            return self:set{
              c = tonumPercent(c),
              m = tonumPercent(m),
              y = tonumPercent(y),
              k = tonumPercent(k),
            }
          end
        else
          local col, dist, w, b, a =
            value:match '([RGBCMYrgbcmy])(%d*)[, ]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
          if col == nil then
            col, dist, w, b, a =
              value:match '([RGBCMYrgbcmy])(%d*)[, ]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)'
          end
          if col then
            col = col:lower()

            local h
            if col == 'r' then
              h = 0
            elseif col == 'y' then
              h = 1 / 6
            elseif col == 'g' then
              h = 2 / 6
            elseif col == 'c' then
              h = 3 / 6
            elseif col == 'b' then
              h = 4 / 6
            elseif col == 'm' then
              h = 5 / 6
            end

            if #dist > 0 then
              h = h + tonumber(dist) / 600
            end

            return self:set{
              h = h,
              w = tonumPercent(w),
              b = tonumPercent(b),
              a = a and tonumPercent(a) or 1,
            }
          end
        end
      else
        value = value:sub(2)
      end

      local pattern
      local div = 0xff
      if #value == 3 then
        pattern = '(%x)(%x)(%x)'
        div = 0xf
      elseif #value == 4 then
        pattern = '(%x)(%x)(%x)(%x)'
        div = 0xf
      elseif #value == 6 then
        pattern = '(%x%x)(%x%x)(%x%x)'
      elseif #value == 8 then
        pattern = '(%x%x)(%x%x)(%x%x)(%x%x)'
      else
        error('Not a valid color: ' .. tostring(value))
      end
      local r, g, b, a = value:match(pattern)
      assert(r ~= nil, 'Not a valid color: ' .. tostring(value))
      self.r = tonumber(r, 16) / div
      self.g = tonumber(g, 16) / div
      self.b = tonumber(b, 16) / div
      self.a = a ~= nil and tonumber(a, 16) / div or 1

      -- table with rgb
    elseif value[1] ~= nil then
      self.r = value[1]
      self.g = value[2]
      self.b = value[3]
      self.a = value[4] or self.a or 1
    elseif value.r ~= nil then
      self.r = value.r
      self.g = value.g or self.g
      self.b = value.b or self.b
      self.a = value.a or self.a

    elseif value.c ~= nil then
      self.r, self.g, self.b = convert.cmyk_to_rgb(value.c, value.m,
        value.y, value.k)
      self.a = 1

      -- table with hs[vl]
    elseif value.h ~= nil then
      if value.w ~= nil then -- hwb
        value.v = 1 - value.b
        value.s = 1 - value.w / value.v
      end

      local hue, saturation = value.h, value.s
      assert(hue ~= nil, saturation ~= nil)

      local r, g, b = 0, 0, 0

      if value.v ~= nil then
        local v = value.v
        local chroma = saturation * v
        r, g, b = hcm_to_rgb(hue, chroma, v - chroma)

      elseif value.l ~= nil then
        local lightness = value.l
        local chroma = (1 - math.abs(2 * lightness - 1)) * saturation
        r, g, b = hcm_to_rgb(hue, chroma, lightness - chroma / 2)
      end

      self.r = r
      self.g = g
      self.b = b
      self.a = value.a or self.a or 1

    else -- Single set mode
      if value.red then
        self.r = value.red
      end
      if value.green then
        self.g = value.green
      end
      if value.blue then
        self.b = value.blue
      end
      if value.alpha then
        self.a = value.alpha
      end

      if value.lightness then
        local h, s, l = self:hsl()
        self:set{
          h = value.hue or h,
          s = value.saturation or s,
          l = value.lightness or l,
        }
        value.hue = nil
        value.saturation = nil
      end

      if value.whiteness or value.blackness then
        local h, w, b = self:hwb()
        self:set{
          h = value.hue or h,
          w = value.whiteness or w,
          b = value.backness or b,
        }
        value.hue = nil
      end

      if value.hue or value.saturation or value.value then
        local h, s, v = self:hsv()
        self:set{
          h = value.hue or h,
          s = value.saturation or s,
          v = value.value or v,
        }
      end

      if value.cyan or value.magenta or value.yellow or value.key then
        local c, m, y, k = self:cmyk()
        self:set{
          c = value.cyan or c,
          m = value.magenta or m,
          y = value.yellow or y,
          k = value.key or k,
        }
      end
    end

    local r, g, b, a = utils.clamp(self.r, 0, 1),
      utils.clamp(self.g, 0, 1), utils.clamp(self.b, 0, 1),
      utils.clamp(self.a, 0, 1)
    assert(r and g and b and a, 'Color invalid')
    return self
  end

  ---Get rgb values.
  ---
  ---@return number[0;1] red
  ---@return number[0;1] green
  ---@return number[0;1] blue
  function Color:rgb()
    return self.r, self.g, self.b
  end

  ---Get rgba values.
  ---
  ---@return number[0;1] red
  ---@return number[0;1] green
  ---@return number[0;1] blue
  ---@return number[0;1] alpha
  function Color:rgba()
    return self.r, self.g, self.b, self.a
  end

  function Color:_hsvm()
    local r, g, b = self.r, self.g, self.b

    local max, max_i = utils.max(r, g, b)
    local min = math.min(r, g, b)
    local chroma = max - min

    local hue
    if chroma == 0 then
      hue = 0
    elseif max_i == 1 then
      hue = ((g - b) / chroma) / 6
    elseif max_i == 2 then
      hue = (2 + (b - r) / chroma) / 6
    elseif max_i == 3 then
      hue = (4 + (r - g) / chroma) / 6
    end

    local saturation = max == 0 and 0 or chroma / max

    return hue, saturation, max, min
  end

  ---Get hsv values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] saturation
  ---@return number[0;1] value
  function Color:hsv()
    local h, s, v = self:_hsvm()
    return h, s, v
  end

  ---Get hsv values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] saturation
  ---@return number[0;1] value
  ---@return number[0;1] alpha
  function Color:hsva()
    local h, s, v = self:_hsvm()
    return h, s, v, self.a
  end

  ---Get hsl values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] saturation
  ---@return number[0;1] lightness
  function Color:hsl()
    local hue, _, max, min = self:_hsvm()
    local lightness = (max + min) / 2

    local saturation = lightness == 0 and 0 or (max - lightness) /
                         math.min(lightness, 1 - lightness)

    if saturation ~= saturation then
      saturation = 0
    end

    return hue, saturation, lightness
  end

  ---Get hsl values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] saturation
  ---@return number[0;1] lightness
  ---@return number[0;1] alpha
  function Color:hsla()
    local h, s, l = self:hsl()
    return h, s, l, self.a
  end

  ---Get hwb values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] whiteness
  ---@return number[0;1] blackness
  function Color:hwb()
    local h, s, v = self:hsv()
    local w = (1 - s) * v
    local b = 1 - v
    return h, w, b
  end

  ---Get hwb values.
  ---
  ---@return number[0;1] hue
  ---@return number[0;1] whiteness
  ---@return number[0;1] blackness
  ---@return number[0;1] alpha
  function Color:hwba()
    local h, w, b = self:hwb()
    return h, w, b, self.a
  end

  ---Get cmyk values.
  ---
  ---@return number[0;1] cyan
  ---@return number[0;1] magenta
  ---@return number[0;1] yellow
  ---@return number[0;1] key
  function Color:cmyk()
    return convert.rgb_to_cmyk(self.r, self.g, self.b)
  end

  ---Rotate hue of color.
  ---
  ---@param number[0;1]|table value Part of full turn or table containing degree or radians
  ---
  ---@return Color self
  ---
  ---@usage color:rotate(0.5)
  ---@usage color:rotate {deg=180}
  ---@usage color:rotate {rad=math.pi}
  function Color:rotate(value)
    local r
    if type(value) == 'number' then
      r = value
    elseif value.rad ~= nil then
      r = value.rad / (math.pi * 2)
    elseif value.deg ~= nil then
      r = value.deg / 360
    else
      error('No valid argument')
    end

    local h, s, v = self:hsv()
    h = (h + r) % 1
    self:set{ h = h, s = s, v = v, a = self.a }

    return self
  end

  ---Invert the color.
  ---
  ---@return Color self
  function Color:invert()
    self.r = 1 - self.r
    self.g = 1 - self.g
    self.b = 1 - self.b
    return self
  end

  ---Reduce saturation to 0.
  ---
  ---@return Color self
  function Color:grey()
    local h, _, v = self:hsv()
    self:set{ h = h, s = 0, v = v, a = self.a }
    return self
  end

  ---Set to black or white depending on lightness.
  ---
  ---@param ?number[0;1] lightness Cutoff point (Default: 0.5)
  ---
  ---@return Color self
  function Color:blackOrWhite(lightness)
    local _, _, l = self:hsl()
    local v = l > lightness and 1 or 0
    self.r = v
    self.g = v
    self.b = v
    return self
  end

  ---Mix two colors together.
  ---
  ---@param Color other
  ---@param ?number strength 0 results in self, 1 results in other (Default: 0.5)
  ---
  ---@return Color self
  function Color:mix(other, strength)
    if strength == nil then
      strength = 0.5
    end
    self.r = self.r * (1 - strength) + other.r * strength
    self.g = self.g * (1 - strength) + other.g * strength
    self.b = self.b * (1 - strength) + other.b * strength
    self.a = self.a * (1 - strength) + other.a * strength
    return self
  end

  ---Generate complementary color.
  ---
  ---@return Color
  function Color:complement()
    return Color(self):rotate(0.5)
  end

  ---Generate analogous color scheme.
  ---
  ---@return Color
  ---@return Color self
  ---@return Color
  function Color:analogous()
    local h, s, v = self:hsv()
    return Color { h = (h - 1 / 12) % 1, s = s, v = v, a = self.a },
      self, Color { h = (h + 1 / 12) % 1, s = s, v = v, a = self.a }
  end

  ---Generate triadic color scheme.
  ---
  ---@return Color self
  ---@return Color
  ---@return Color
  function Color:triad()
    local h, s, v = self:hsv()
    return self,
      Color { h = (h + 1 / 3) % 1, s = s, v = v, a = self.a },
      Color { h = (h + 2 / 3) % 1, s = s, v = v, a = self.a }
  end

  ---Generate tetradic color scheme.
  ---
  ---@return Color self
  ---@return Color
  ---@return Color
  ---@return Color
  function Color:tetrad()
    local h, s, v = self:hsv()
    return self,
      Color { h = (h + 1 / 4) % 1, s = s, v = v, a = self.a },
      Color { h = (h + 2 / 4) % 1, s = s, v = v, a = self.a },
      Color { h = (h + 3 / 4) % 1, s = s, v = v, a = self.a }
  end

  ---Generate compound color scheme.
  ---
  ---@return Color
  ---@return Color self
  ---@return Color
  function Color:compound()
    local ca, _, cb = self:complement():analogous()
    return ca, self, cb
  end

  ---Generate evenly spaced color scheme.
  -- <br>
  -- Generalization of `triad` and `tetrad`.
  ---
  ---@param int     n Return n colors
  ---@param ?number r Space colors over r rotations (Default: 1)
  ---
  ---@return {Color,...} Table with n colors including self at index 1
  function Color:evenlySpaced(n, r)
    assert(n > 0, 'n needs to be greater than 0')
    r = r or 1

    local res = { self }

    local rot = r / n
    local h, s, v = self:hsv()
    local a = self.a

    for i = 1, n - 1 do
      h = (h + rot) % 1
      table.insert(res, Color { h = h, s = s, v = v, a = a })
    end

    return res
  end

  ---Get string representation of color.
  ---
  -- If `format` is `nil`, `color:tostring()` is the same as `tostring(color)`.
  ---
  ---@param ?string format One of: `#fff`, `#ffff`, `#ffffff`, `#ffffffff`,
  --  rgb, rgba, hsv, hsva, hsl, hsla, hwb, hwba, ncol, cmyk
  ---
  ---@return string
  ---
  ---@see Color:__tostring
  function Color:tostring(format)
    if format == nil then
      return tostring(self)
    end

    format = format:lower()

    if format:sub(1, 1) == '#' then
      if #format == 4 then
        return string.format('#%x%x%x', utils.round(self.r * 0xf),
          utils.round(self.g * 0xf), utils.round(self.b * 0xf))
      elseif #format == 5 then
        return string.format('#%x%x%x%x', utils.round(self.r * 0xf),
          utils.round(self.g * 0xf), utils.round(self.b * 0xf),
          utils.round(self.a * 0xf))
      elseif #format == 7 then
        return string.format('#%02x%02x%02x',
          utils.round(self.r * 0xff), utils.round(self.g * 0xff),
          utils.round(self.b * 0xff))
      elseif #format == 9 then
        return string.format('#%02x%02x%02x%02x',
          utils.round(self.r * 0xff), utils.round(self.g * 0xff),
          utils.round(self.b * 0xff), utils.round(self.a * 0xff))
      end
    elseif format == 'rgb' then
      return string.format('rgb(%d, %d, %d)',
        utils.round(self.r * 0xff), utils.round(self.g * 0xff),
        utils.round(self.b * 0xff))
    elseif format == 'rgba' then
      return string.format('rgba(%d, %d, %d, %s)',
        utils.round(self.r * 0xff), utils.round(self.g * 0xff),
        utils.round(self.b * 0xff), self.a)
    elseif format == 'hsv' then
      local h, s, v = self:hsv()
      return string.format('hsv(%d, %d%%, %d%%)', utils.round(h * 360),
        utils.round(s * 100), utils.round(v * 100))
    elseif format == 'hsva' then
      local h, s, v, a = self:hsva()
      return string.format('hsva(%d, %d%%, %d%%, %s)',
        utils.round(h * 360), utils.round(s * 100),
        utils.round(v * 100), a)
    elseif format == 'hsl' then
      local h, s, l = self:hsl()
      return string.format('hsl(%d, %d%%, %d%%)', utils.round(h * 360),
        utils.round(s * 100), utils.round(l * 100))
    elseif format == 'hsla' then
      local h, s, l, a = self:hsla()
      return string.format('hsla(%d, %d%%, %d%%, %s)',
        utils.round(h * 360), utils.round(s * 100),
        utils.round(l * 100), a)
    elseif format == 'hwb' then
      local h, w, b = self:hwb()
      return string.format('hwb(%d, %d%%, %d%%)', utils.round(h * 360),
        utils.round(w * 100), utils.round(b * 100))
    elseif format == 'hwba' then
      local h, w, b, a = self:hwba()
      return string.format('hwba(%d, %d%%, %d%%, %s)',
        utils.round(h * 360), utils.round(w * 100),
        utils.round(b * 100), a)
    elseif format == 'ncol' then
      local h, w, b = self:hwb()
      local h_maj, h_min = math.modf(h * 6)
      h_maj = h_maj % 6

      local col
      if h_maj == 0 then
        col = 'R'
      elseif h_maj == 1 then
        col = 'Y'
      elseif h_maj == 2 then
        col = 'G'
      elseif h_maj == 3 then
        col = 'C'
      elseif h_maj == 4 then
        col = 'B'
      else
        col = 'M'
      end

      return string.format('%s%d, %d%%, %d%%', col,
        utils.round(h_min * 100), utils.round(w * 100),
        utils.round(b * 100))
    elseif format == 'cmyk' then
      local c, m, y, k = self:cmyk()
      return string.format('cymk(%d%%, %d%%, %d%%, %d%%)',
        utils.round(c * 100), utils.round(m * 100),
        utils.round(y * 100), utils.round(k * 100))
    end

    return tostring(self)
  end

  ---Get color in rgb hex notation.
  -- <br>
  -- only adds alpha value if `color.a < 1`
  ---
  ---@return string `#rrggbb` | `#rrggbbaa`
  ---
  ---@see Color:tostring
  function Color:__tostring()
    if self.a < 1 then
      return string.format('#%02x%02x%02x%02x',
        utils.round(self.r * 0xff), utils.round(self.g * 0xff),
        utils.round(self.b * 0xff), utils.round(self.a * 0xff))
    else
      return string.format('#%02x%02x%02x', utils.round(self.r * 0xff),
        utils.round(self.g * 0xff), utils.round(self.b * 0xff))
    end
  end

  ---Check if colors are equal.
  ---
  ---@param Color other
  ---
  ---@return boolean all values are equal
  function Color:__eq(other)
    return
      self.r == other.r and self.g == other.g and self.b == other.b and
        self.a == other.a
  end

  ---Checks whether color is darker.
  ---
  ---@param Color other
  ---
  ---@return boolean self is darker than other
  function Color:__lt(other)
    local _, _, la = self:hsl()
    local _, _, lb = other:hsl()
    return la < lb
  end

  ---Checks whether color is as dark or darker.
  ---
  ---@param Color other
  ---
  ---@return boolean self is as dark or darker than other
  function Color:__le(other)
    local _, _, la = self:hsl()
    local _, _, lb = other:hsl()
    return la <= lb
  end

  ---Iterate through color.
  ---
  -- Iterates through r, g, b, and a.
  function Color:__pairs()
    local function iter(tbl, k)
      if k == nil then
        return 'r', self.r
      elseif k == 'r' then
        return 'g', self.g
      elseif k == 'g' then
        return 'b', self.b
      elseif k == 'b' then
        return 'a', self.a
      end
    end

    return iter, self, nil
  end

  ---Get inverted clone of color.
  ---
  ---@return Color
  function Color:__unm()
    return Color(self):invert()
  end

  ---Mix two colors evenly.
  ---
  ---@param Color a first color
  ---@param Color b second color
  ---
  ---@return Color new color
  ---
  ---@see Color:mix
  function Color.__add(a, b)
    assert(Color.isColor(a) and Color.isColor(b),
      'Can only add two colors.')
    return Color(a):mix(b)
  end

  ---Complement of even mix.
  ---
  ---@param Color a first color
  ---@param Color b second color
  ---
  ---@return Color new color
  ---
  ---@see Color:mix
  ---@see Color.__add
  function Color.__sub(a, b)
    assert(Color.isColor(a) and Color.isColor(b),
      'Can only add two colors.')
    return Color(a):mix(b):rotate(0.5)
  end

  ---Apply rgb mask to color.
  ---
  ---@param Color|number a color or mask
  ---@param Color|number b color or mask (if a and b are colors b is used as mask)
  ---
  ---@return Color new color
  ---
  ---@usage local new_col = color & 0xff00ff -- get new color without the green channel
  function Color.__band(a, b)
    local color, mask
    if Color.isColor(a) and type(b) == 'number' then
      color = a
      mask = b
    elseif Color.isColor(b) and type(a) == 'number' then
      color = b
      mask = a
    elseif Color.isColor(a) and Color.isColor(b) then
      color = a
      mask = bit_lshift(utils.round(b.r * 0xff), 16) +
               bit_lshift(utils.round(b.g * 0xff), 8) +
               utils.round(b.b * 0xff)
    else
      error(
        'Required arguments: Color|number,Color|number Received: ' ..
          type(a) .. ',' .. type(b))
    end

    return Color {
      bit_and(utils.round(color.r * 0xff), bit_rshift(mask, 16)) / 0xff,
      bit_and(utils.round(color.g * 0xff), bit_rshift(mask, 8)) / 0xff,
      bit_and(utils.round(color.b * 0xff), mask) / 0xff,
      color.a,
    }
  end

  ---Apply rgb mask to color, providing backwards compatibility for Lua 5.1 and LuaJIT 2.1.0-beta3 (e.g. inside Neovim), which don't provide native support for bitwise operators.
  ---
  ---@param a Color|number # color or mask
  ---@param b Color|number # color or mask (if a and b are colors b is used as mask)
  ---
  ---@return Color new color
  ---
  ---@usage local new_col = Color.band(color, 0xff00ff) -- get new color without the green channel
  function Color.band(a, b)
    return Color.__band(a, b)
  end

  ---Check whether `color` is a Color.
  ---
  ---@param color Color
  ---
  ---@return boolean # is a color
  ---
  ---@usage if Color.isColor(color) then print "It's a color!" end
  function Color.isColor(color)
    return color ~= nil and color.__is_color == true
  end

  ---Format a PDF colorstack string. This string can be assigned to the
  ---`node.data` field of a PDF colorstack node.
  ---
  ---@return string # A string like this example `1 0 0 rg 1 0 0 RG`
  function Color:format_pdf_colorstack_string()
    return table.concat({
      self.r,
      self.g,
      self.b,
      'rg',
      self.r,
      self.g,
      self.b,
      'RG',
    }, ' ')
  end

  ---Create a PDF colorstack node.
  ---
  ---@param command "set"|"push"|"pop"|"current"
  ---
  ---@return PdfColorstackWhatsitNode
  function Color:create_pdf_colorstack_node(command)
    local whatsit = node.new('whatsit', 'pdf_colorstack') --[[@as PdfColorstackWhatsitNode]]
    if command == 'set' then
      whatsit.command = 0
    elseif command == 'push' then
      whatsit.command = 1
    elseif command == 'pop' then
      whatsit.command = 2
    elseif command == 'current' then
      whatsit.command = 3
    end
    if command ~= 'pop' then
      whatsit.data = self:format_pdf_colorstack_string()
    end
    return whatsit
  end

  ---Write a PDF colorstock node using `node.write()`.
  ---
  ---@param command "set"|"push"|"pop"|"current"
  ---
  function Color:write_pdf_colorstack_node(command)
    node.write(self:create_pdf_colorstack_node(command))
  end

  function Color:write_box()
    self:write_pdf_colorstack_node('push')
    local rule = node.new('rule') --[[@as RuleNode]]
    rule.width = tex.sp('0.5cm')
    rule.height = tex.sp('0.5cm')
    node.write(rule)
    self:write_pdf_colorstack_node('pop')
  end

  return Color

end)()

---
---
---
---@param scheme 'base'|'svg'|'x11'
local function print_color_table(scheme)
  for _, name in pairs(schemes[scheme]) do
    -- local color = Color({ r = rgb[1], g = rgb[2], b = rgb[3] })
    local color = colors[name]
    local r = utils.round(color[1] * 255)
    local g = utils.round(color[2] * 255)
    local b = utils.round(color[3] * 255)
    tex.print('\\par\\noindent')
    tex.print(string.format('\\FarbeBox{rgb(%d, %d, %d} ', r, g, b))
    tex.print('\\texttt{\\tiny\\enspace ' .. name .. '}')
  end
end

---
---@param operator string # The PDF color operator, e. g. `0.2 0.5 1 rg 0.2 0.5 1 RG`
---
---@return Color|nil
local function convert_pdf_color_operator(operator)
  operator = operator:lower()

  ---
  ---@param count_floats integer
  ---@param suffix string
  ---
  ---@return string
  local function build_pattern(count_floats, suffix)
    local pattern_float = '(%d*%.?%d+)'

    local patterns = {}
    for i = 1, count_floats, 1 do
      patterns[i] = pattern_float
    end
    patterns[count_floats + 1] = suffix

    return table.concat(patterns, ' +')
  end

  local n = tonumber

  local r, g, b = operator:match(build_pattern(3, 'rg'))
  if r ~= nil then
    log.debug('operator to RGB: %s %s %s', r, g, b)
    return Color({ r = n(r), g = n(g), b = n(b) })
  end

  local c, m, y, k = operator:match(build_pattern(3, 'k'))
  if c ~= nil then
    log.debug('operator to CMYK: %s %s %s %s', c, m, y, k)
    return Color({ c = n(c), m = n(m), y = n(y), k = n(k) })
  end

  local gray = operator:match(build_pattern(1, 'g'))
  if gray ~= nil then
    log.debug('operator to GRAY: %s', gray)
    return Color({ r = n(gray), g = n(gray), b = n(gray) })
  end
end

---
---@param name string # The name of the color.
---@param operator string # The PDF color operator, e. g. `0.2 0.5 1 rg 0.2 0.5 1 RG`
local function import_color(name, operator)
  if colors[name] ~= nil then
    return
  end
  local color = convert_pdf_color_operator(operator)
  log.info('Import new color: name %s, operator: %s, converted: %s',
    name, operator, color)
  if color ~= nil then
    colors[name] = { color.r, color.g, color.b }
  end
end

return {
  convert = convert,
  Color = Color --[[@as Color]] ,
  print_color_table = print_color_table,
  import_color = import_color,
}
