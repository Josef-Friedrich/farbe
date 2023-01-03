-- farbe.lua
-- Copyright 2022 Josef Friedrich
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
local colors = {
  -- base colors
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

  -- svg
  AliceBlue = { 0.94, 0.972, 0.972 },
  AntiqueWhite = { 0.98, 0.92, 0.92 },
  Aqua = { 0, 1, 1 },
  Aquamarine = { 0.498, 1, 1 },
  Azure = { 0.94, 1, 1 },
  Beige = { 0.96, 0.96, 0.96 },
  Bisque = { 1, 0.894, 0.894 },
  Black = { 0, 0, 0 },
  BlanchedAlmond = { 1, 0.92, 0.92 },
  Blue = { 0, 0, 0 },
  BlueViolet = { 0.54, 0.17, 0.17 },
  Brown = { 0.648, 0.165, 0.165 },
  BurlyWood = { 0.87, 0.72, 0.72 },
  CadetBlue = { 0.372, 0.62, 0.62 },
  Chartreuse = { 0.498, 1, 1 },
  Chocolate = { 0.824, 0.41, 0.41 },
  Coral = { 1, 0.498, 0.498 },
  CornflowerBlue = { 0.392, 0.585, 0.585 },
  Cornsilk = { 1, 0.972, 0.972 },
  Crimson = { 0.864, 0.08, 0.08 },
  Cyan = { 0, 1, 1 },
  DarkBlue = { 0, 0, 0 },
  DarkCyan = { 0, 0.545, 0.545 },
  DarkGoldenrod = { 0.72, 0.525, 0.525 },
  DarkGray = { 0.664, 0.664, 0.664 },
  DarkGreen = { 0, 0.392, 0.392 },
  DarkGrey = { 0.664, 0.664, 0.664 },
  DarkKhaki = { 0.74, 0.716, 0.716 },
  DarkMagenta = { 0.545, 0, 0 },
  DarkOliveGreen = { 0.332, 0.42, 0.42 },
  DarkOrange = { 1, 0.55, 0.55 },
  DarkOrchid = { 0.6, 0.196, 0.196 },
  DarkRed = { 0.545, 0, 0 },
  DarkSalmon = { 0.912, 0.59, 0.59 },
  DarkSeaGreen = { 0.56, 0.736, 0.736 },
  DarkSlateBlue = { 0.284, 0.24, 0.24 },
  DarkSlateGray = { 0.185, 0.31, 0.31 },
  DarkSlateGrey = { 0.185, 0.31, 0.31 },
  DarkTurquoise = { 0, 0.808, 0.808 },
  DarkViolet = { 0.58, 0, 0 },
  DeepPink = { 1, 0.08, 0.08 },
  DeepSkyBlue = { 0, 0.75, 0.75 },
  DimGray = { 0.41, 0.41, 0.41 },
  DimGrey = { 0.41, 0.41, 0.41 },
  DodgerBlue = { 0.116, 0.565, 0.565 },
  FireBrick = { 0.698, 0.132, 0.132 },
  FloralWhite = { 1, 0.98, 0.98 },
  ForestGreen = { 0.132, 0.545, 0.545 },
  Fuchsia = { 1, 0, 0 },
  Gainsboro = { 0.864, 0.864, 0.864 },
  GhostWhite = { 0.972, 0.972, 0.972 },
  Gold = { 1, 0.844, 0.844 },
  Goldenrod = { 0.855, 0.648, 0.648 },
  Gray = { 0.5, 0.5, 0.5 },
  Green = { 0, 0.5, 0.5 },
  GreenYellow = { 0.68, 1, 1 },
  Grey = { 0.5, 0.5, 0.5 },
  Honeydew = { 0.94, 1, 1 },
  HotPink = { 1, 0.41, 0.41 },
  IndianRed = { 0.804, 0.36, 0.36 },
  Indigo = { 0.294, 0, 0 },
  Ivory = { 1, 1, 1 },
  Khaki = { 0.94, 0.9, 0.9 },
  Lavender = { 0.9, 0.9, 0.9 },
  LavenderBlush = { 1, 0.94, 0.94 },
  LawnGreen = { 0.488, 0.99, 0.99 },
  LemonChiffon = { 1, 0.98, 0.98 },
  LightBlue = { 0.68, 0.848, 0.848 },
  LightCoral = { 0.94, 0.5, 0.5 },
  LightCyan = { 0.88, 1, 1 },
  LightGoldenrod = { 0.933, 0.867, 0.867 },
  LightGoldenrodYellow = { 0.98, 0.98, 0.98 },
  LightGray = { 0.828, 0.828, 0.828 },
  LightGreen = { 0.565, 0.932, 0.932 },
  LightGrey = { 0.828, 0.828, 0.828 },
  LightPink = { 1, 0.712, 0.712 },
  LightSalmon = { 1, 0.628, 0.628 },
  LightSeaGreen = { 0.125, 0.698, 0.698 },
  LightSkyBlue = { 0.53, 0.808, 0.808 },
  LightSlateBlue = { 0.518, 0.44, 0.44 },
  LightSlateGray = { 0.468, 0.532, 0.532 },
  LightSlateGrey = { 0.468, 0.532, 0.532 },
  LightSteelBlue = { 0.69, 0.77, 0.77 },
  LightYellow = { 1, 1, 1 },
  Lime = { 0, 1, 1 },
  LimeGreen = { 0.196, 0.804, 0.804 },
  Linen = { 0.98, 0.94, 0.94 },
  Magenta = { 1, 0, 0 },
  Maroon = { 0.5, 0, 0 },
  MediumAquamarine = { 0.4, 0.804, 0.804 },
  MediumBlue = { 0, 0, 0 },
  MediumOrchid = { 0.73, 0.332, 0.332 },
  MediumPurple = { 0.576, 0.44, 0.44 },
  MediumSeaGreen = { 0.235, 0.7, 0.7 },
  MediumSlateBlue = { 0.484, 0.408, 0.408 },
  MediumSpringGreen = { 0, 0.98, 0.98 },
  MediumTurquoise = { 0.284, 0.82, 0.82 },
  MediumVioletRed = { 0.78, 0.084, 0.084 },
  MidnightBlue = { 0.098, 0.098, 0.098 },
  MintCream = { 0.96, 1, 1 },
  MistyRose = { 1, 0.894, 0.894 },
  Moccasin = { 1, 0.894, 0.894 },
  NavajoWhite = { 1, 0.87, 0.87 },
  Navy = { 0, 0, 0 },
  NavyBlue = { 0, 0, 0 },
  OldLace = { 0.992, 0.96, 0.96 },
  Olive = { 0.5, 0.5, 0.5 },
  OliveDrab = { 0.42, 0.556, 0.556 },
  Orange = { 1, 0.648, 0.648 },
  OrangeRed = { 1, 0.27, 0.27 },
  Orchid = { 0.855, 0.44, 0.44 },
  PaleGoldenrod = { 0.932, 0.91, 0.91 },
  PaleGreen = { 0.596, 0.985, 0.985 },
  PaleTurquoise = { 0.688, 0.932, 0.932 },
  PaleVioletRed = { 0.86, 0.44, 0.44 },
  PapayaWhip = { 1, 0.936, 0.936 },
  PeachPuff = { 1, 0.855, 0.855 },
  Peru = { 0.804, 0.52, 0.52 },
  Pink = { 1, 0.752, 0.752 },
  Plum = { 0.868, 0.628, 0.628 },
  PowderBlue = { 0.69, 0.88, 0.88 },
  Purple = { 0.5, 0, 0 },
  Red = { 1, 0, 0 },
  RosyBrown = { 0.736, 0.56, 0.56 },
  RoyalBlue = { 0.255, 0.41, 0.41 },
  SaddleBrown = { 0.545, 0.27, 0.27 },
  Salmon = { 0.98, 0.5, 0.5 },
  SandyBrown = { 0.956, 0.644, 0.644 },
  SeaGreen = { 0.18, 0.545, 0.545 },
  Seashell = { 1, 0.96, 0.96 },
  Sienna = { 0.628, 0.32, 0.32 },
  Silver = { 0.752, 0.752, 0.752 },
  SkyBlue = { 0.53, 0.808, 0.808 },
  SlateBlue = { 0.415, 0.352, 0.352 },
  SlateGray = { 0.44, 0.5, 0.5 },
  SlateGrey = { 0.44, 0.5, 0.5 },
  Snow = { 1, 0.98, 0.98 },
  SpringGreen = { 0, 1, 1 },
  SteelBlue = { 0.275, 0.51, 0.51 },
  Tan = { 0.824, 0.705, 0.705 },
  Teal = { 0, 0.5, 0.5 },
  Thistle = { 0.848, 0.75, 0.75 },
  Tomato = { 1, 0.39, 0.39 },
  Turquoise = { 0.25, 0.88, 0.88 },
  Violet = { 0.932, 0.51, 0.51 },
  VioletRed = { 0.816, 0.125, 0.125 },
  Wheat = { 0.96, 0.87, 0.87 },
  White = { 1, 1, 1 },
  WhiteSmoke = { 0.96, 0.96, 0.96 },
  Yellow = { 1, 1, 1 },
  YellowGreen = { 0.604, 0.804, 0.804 },

  ---x11
  AntiqueWhite1 = { 1, 0.936, 0.936 },
  AntiqueWhite2 = { 0.932, 0.875, 0.875 },
  AntiqueWhite3 = { 0.804, 0.752, 0.752 },
  AntiqueWhite4 = { 0.545, 0.512, 0.512 },
  Aquamarine1 = { 0.498, 1, 1 },
  Aquamarine2 = { 0.464, 0.932, 0.932 },
  Aquamarine3 = { 0.4, 0.804, 0.804 },
  Aquamarine4 = { 0.27, 0.545, 0.545 },
  Azure1 = { 0.94, 1, 1 },
  Azure2 = { 0.88, 0.932, 0.932 },
  Azure3 = { 0.756, 0.804, 0.804 },
  Azure4 = { 0.512, 0.545, 0.545 },
  Bisque1 = { 1, 0.894, 0.894 },
  Bisque2 = { 0.932, 0.835, 0.835 },
  Bisque3 = { 0.804, 0.716, 0.716 },
  Bisque4 = { 0.545, 0.49, 0.49 },
  Blue1 = { 0, 0, 0 },
  Blue2 = { 0, 0, 0 },
  Blue3 = { 0, 0, 0 },
  Blue4 = { 0, 0, 0 },
  Brown1 = { 1, 0.25, 0.25 },
  Brown2 = { 0.932, 0.23, 0.23 },
  Brown3 = { 0.804, 0.2, 0.2 },
  Brown4 = { 0.545, 0.136, 0.136 },
  Burlywood1 = { 1, 0.828, 0.828 },
  Burlywood2 = { 0.932, 0.772, 0.772 },
  Burlywood3 = { 0.804, 0.668, 0.668 },
  Burlywood4 = { 0.545, 0.45, 0.45 },
  CadetBlue1 = { 0.596, 0.96, 0.96 },
  CadetBlue2 = { 0.556, 0.898, 0.898 },
  CadetBlue3 = { 0.48, 0.772, 0.772 },
  CadetBlue4 = { 0.325, 0.525, 0.525 },
  Chartreuse1 = { 0.498, 1, 1 },
  Chartreuse2 = { 0.464, 0.932, 0.932 },
  Chartreuse3 = { 0.4, 0.804, 0.804 },
  Chartreuse4 = { 0.27, 0.545, 0.545 },
  Chocolate1 = { 1, 0.498, 0.498 },
  Chocolate2 = { 0.932, 0.464, 0.464 },
  Chocolate3 = { 0.804, 0.4, 0.4 },
  Chocolate4 = { 0.545, 0.27, 0.27 },
  Coral1 = { 1, 0.448, 0.448 },
  Coral2 = { 0.932, 0.415, 0.415 },
  Coral3 = { 0.804, 0.356, 0.356 },
  Coral4 = { 0.545, 0.244, 0.244 },
  Cornsilk1 = { 1, 0.972, 0.972 },
  Cornsilk2 = { 0.932, 0.91, 0.91 },
  Cornsilk3 = { 0.804, 0.785, 0.785 },
  Cornsilk4 = { 0.545, 0.532, 0.532 },
  Cyan1 = { 0, 1, 1 },
  Cyan2 = { 0, 0.932, 0.932 },
  Cyan3 = { 0, 0.804, 0.804 },
  Cyan4 = { 0, 0.545, 0.545 },
  DarkGoldenrod1 = { 1, 0.725, 0.725 },
  DarkGoldenrod2 = { 0.932, 0.68, 0.68 },
  DarkGoldenrod3 = { 0.804, 0.585, 0.585 },
  DarkGoldenrod4 = { 0.545, 0.396, 0.396 },
  DarkOliveGreen1 = { 0.792, 1, 1 },
  DarkOliveGreen2 = { 0.736, 0.932, 0.932 },
  DarkOliveGreen3 = { 0.635, 0.804, 0.804 },
  DarkOliveGreen4 = { 0.43, 0.545, 0.545 },
  DarkOrange1 = { 1, 0.498, 0.498 },
  DarkOrange2 = { 0.932, 0.464, 0.464 },
  DarkOrange3 = { 0.804, 0.4, 0.4 },
  DarkOrange4 = { 0.545, 0.27, 0.27 },
  DarkOrchid1 = { 0.75, 0.244, 0.244 },
  DarkOrchid2 = { 0.698, 0.228, 0.228 },
  DarkOrchid3 = { 0.604, 0.196, 0.196 },
  DarkOrchid4 = { 0.408, 0.132, 0.132 },
  DarkSeaGreen1 = { 0.756, 1, 1 },
  DarkSeaGreen2 = { 0.705, 0.932, 0.932 },
  DarkSeaGreen3 = { 0.608, 0.804, 0.804 },
  DarkSeaGreen4 = { 0.41, 0.545, 0.545 },
  DarkSlateGray1 = { 0.592, 1, 1 },
  DarkSlateGray2 = { 0.552, 0.932, 0.932 },
  DarkSlateGray3 = { 0.475, 0.804, 0.804 },
  DarkSlateGray4 = { 0.32, 0.545, 0.545 },
  DeepPink1 = { 1, 0.08, 0.08 },
  DeepPink2 = { 0.932, 0.07, 0.07 },
  DeepPink3 = { 0.804, 0.064, 0.064 },
  DeepPink4 = { 0.545, 0.04, 0.04 },
  DeepSkyBlue1 = { 0, 0.75, 0.75 },
  DeepSkyBlue2 = { 0, 0.698, 0.698 },
  DeepSkyBlue3 = { 0, 0.604, 0.604 },
  DeepSkyBlue4 = { 0, 0.408, 0.408 },
  DodgerBlue1 = { 0.116, 0.565, 0.565 },
  DodgerBlue2 = { 0.11, 0.525, 0.525 },
  DodgerBlue3 = { 0.094, 0.455, 0.455 },
  DodgerBlue4 = { 0.064, 0.305, 0.305 },
  Firebrick1 = { 1, 0.19, 0.19 },
  Firebrick2 = { 0.932, 0.172, 0.172 },
  Firebrick3 = { 0.804, 0.15, 0.15 },
  Firebrick4 = { 0.545, 0.1, 0.1 },
  Gold1 = { 1, 0.844, 0.844 },
  Gold2 = { 0.932, 0.79, 0.79 },
  Gold3 = { 0.804, 0.68, 0.68 },
  Gold4 = { 0.545, 0.46, 0.46 },
  Goldenrod1 = { 1, 0.756, 0.756 },
  Goldenrod2 = { 0.932, 0.705, 0.705 },
  Goldenrod3 = { 0.804, 0.608, 0.608 },
  Goldenrod4 = { 0.545, 0.41, 0.41 },
  Green1 = { 0, 1, 1 },
  Green2 = { 0, 0.932, 0.932 },
  Green3 = { 0, 0.804, 0.804 },
  Green4 = { 0, 0.545, 0.545 },
  Honeydew1 = { 0.94, 1, 1 },
  Honeydew2 = { 0.88, 0.932, 0.932 },
  Honeydew3 = { 0.756, 0.804, 0.804 },
  Honeydew4 = { 0.512, 0.545, 0.545 },
  HotPink1 = { 1, 0.43, 0.43 },
  HotPink2 = { 0.932, 0.415, 0.415 },
  HotPink3 = { 0.804, 0.376, 0.376 },
  HotPink4 = { 0.545, 0.228, 0.228 },
  IndianRed1 = { 1, 0.415, 0.415 },
  IndianRed2 = { 0.932, 0.39, 0.39 },
  IndianRed3 = { 0.804, 0.332, 0.332 },
  IndianRed4 = { 0.545, 0.228, 0.228 },
  Ivory1 = { 1, 1, 1 },
  Ivory2 = { 0.932, 0.932, 0.932 },
  Ivory3 = { 0.804, 0.804, 0.804 },
  Ivory4 = { 0.545, 0.545, 0.545 },
  Khaki1 = { 1, 0.965, 0.965 },
  Khaki2 = { 0.932, 0.9, 0.9 },
  Khaki3 = { 0.804, 0.776, 0.776 },
  Khaki4 = { 0.545, 0.525, 0.525 },
  LavenderBlush1 = { 1, 0.94, 0.94 },
  LavenderBlush2 = { 0.932, 0.88, 0.88 },
  LavenderBlush3 = { 0.804, 0.756, 0.756 },
  LavenderBlush4 = { 0.545, 0.512, 0.512 },
  LemonChiffon1 = { 1, 0.98, 0.98 },
  LemonChiffon2 = { 0.932, 0.912, 0.912 },
  LemonChiffon3 = { 0.804, 0.79, 0.79 },
  LemonChiffon4 = { 0.545, 0.536, 0.536 },
  LightBlue1 = { 0.75, 0.936, 0.936 },
  LightBlue2 = { 0.698, 0.875, 0.875 },
  LightBlue3 = { 0.604, 0.752, 0.752 },
  LightBlue4 = { 0.408, 0.512, 0.512 },
  LightCyan1 = { 0.88, 1, 1 },
  LightCyan2 = { 0.82, 0.932, 0.932 },
  LightCyan3 = { 0.705, 0.804, 0.804 },
  LightCyan4 = { 0.48, 0.545, 0.545 },
  LightGoldenrod1 = { 1, 0.925, 0.925 },
  LightGoldenrod2 = { 0.932, 0.864, 0.864 },
  LightGoldenrod3 = { 0.804, 0.745, 0.745 },
  LightGoldenrod4 = { 0.545, 0.505, 0.505 },
  LightPink1 = { 1, 0.684, 0.684 },
  LightPink2 = { 0.932, 0.635, 0.635 },
  LightPink3 = { 0.804, 0.55, 0.55 },
  LightPink4 = { 0.545, 0.372, 0.372 },
  LightSalmon1 = { 1, 0.628, 0.628 },
  LightSalmon2 = { 0.932, 0.585, 0.585 },
  LightSalmon3 = { 0.804, 0.505, 0.505 },
  LightSalmon4 = { 0.545, 0.34, 0.34 },
  LightSkyBlue1 = { 0.69, 0.888, 0.888 },
  LightSkyBlue2 = { 0.644, 0.828, 0.828 },
  LightSkyBlue3 = { 0.552, 0.712, 0.712 },
  LightSkyBlue4 = { 0.376, 0.484, 0.484 },
  LightSteelBlue1 = { 0.792, 0.884, 0.884 },
  LightSteelBlue2 = { 0.736, 0.824, 0.824 },
  LightSteelBlue3 = { 0.635, 0.71, 0.71 },
  LightSteelBlue4 = { 0.43, 0.484, 0.484 },
  LightYellow1 = { 1, 1, 1 },
  LightYellow2 = { 0.932, 0.932, 0.932 },
  LightYellow3 = { 0.804, 0.804, 0.804 },
  LightYellow4 = { 0.545, 0.545, 0.545 },
  Magenta1 = { 1, 0, 0 },
  Magenta2 = { 0.932, 0, 0 },
  Magenta3 = { 0.804, 0, 0 },
  Magenta4 = { 0.545, 0, 0 },
  Maroon1 = { 1, 0.204, 0.204 },
  Maroon2 = { 0.932, 0.19, 0.19 },
  Maroon3 = { 0.804, 0.16, 0.16 },
  Maroon4 = { 0.545, 0.11, 0.11 },
  MediumOrchid1 = { 0.88, 0.4, 0.4 },
  MediumOrchid2 = { 0.82, 0.372, 0.372 },
  MediumOrchid3 = { 0.705, 0.32, 0.32 },
  MediumOrchid4 = { 0.48, 0.215, 0.215 },
  MediumPurple1 = { 0.67, 0.51, 0.51 },
  MediumPurple2 = { 0.624, 0.475, 0.475 },
  MediumPurple3 = { 0.536, 0.408, 0.408 },
  MediumPurple4 = { 0.365, 0.28, 0.28 },
  MistyRose1 = { 1, 0.894, 0.894 },
  MistyRose2 = { 0.932, 0.835, 0.835 },
  MistyRose3 = { 0.804, 0.716, 0.716 },
  MistyRose4 = { 0.545, 0.49, 0.49 },
  NavajoWhite1 = { 1, 0.87, 0.87 },
  NavajoWhite2 = { 0.932, 0.81, 0.81 },
  NavajoWhite3 = { 0.804, 0.7, 0.7 },
  NavajoWhite4 = { 0.545, 0.475, 0.475 },
  OliveDrab1 = { 0.752, 1, 1 },
  OliveDrab2 = { 0.7, 0.932, 0.932 },
  OliveDrab3 = { 0.604, 0.804, 0.804 },
  OliveDrab4 = { 0.41, 0.545, 0.545 },
  Orange1 = { 1, 0.648, 0.648 },
  Orange2 = { 0.932, 0.604, 0.604 },
  Orange3 = { 0.804, 0.52, 0.52 },
  Orange4 = { 0.545, 0.352, 0.352 },
  OrangeRed1 = { 1, 0.27, 0.27 },
  OrangeRed2 = { 0.932, 0.25, 0.25 },
  OrangeRed3 = { 0.804, 0.215, 0.215 },
  OrangeRed4 = { 0.545, 0.145, 0.145 },
  Orchid1 = { 1, 0.512, 0.512 },
  Orchid2 = { 0.932, 0.48, 0.48 },
  Orchid3 = { 0.804, 0.41, 0.41 },
  Orchid4 = { 0.545, 0.28, 0.28 },
  PaleGreen1 = { 0.604, 1, 1 },
  PaleGreen2 = { 0.565, 0.932, 0.932 },
  PaleGreen3 = { 0.488, 0.804, 0.804 },
  PaleGreen4 = { 0.33, 0.545, 0.545 },
  PaleTurquoise1 = { 0.732, 1, 1 },
  PaleTurquoise2 = { 0.684, 0.932, 0.932 },
  PaleTurquoise3 = { 0.59, 0.804, 0.804 },
  PaleTurquoise4 = { 0.4, 0.545, 0.545 },
  PaleVioletRed1 = { 1, 0.51, 0.51 },
  PaleVioletRed2 = { 0.932, 0.475, 0.475 },
  PaleVioletRed3 = { 0.804, 0.408, 0.408 },
  PaleVioletRed4 = { 0.545, 0.28, 0.28 },
  PeachPuff1 = { 1, 0.855, 0.855 },
  PeachPuff2 = { 0.932, 0.796, 0.796 },
  PeachPuff3 = { 0.804, 0.688, 0.688 },
  PeachPuff4 = { 0.545, 0.468, 0.468 },
  Pink1 = { 1, 0.71, 0.71 },
  Pink2 = { 0.932, 0.664, 0.664 },
  Pink3 = { 0.804, 0.57, 0.57 },
  Pink4 = { 0.545, 0.39, 0.39 },
  Plum1 = { 1, 0.732, 0.732 },
  Plum2 = { 0.932, 0.684, 0.684 },
  Plum3 = { 0.804, 0.59, 0.59 },
  Plum4 = { 0.545, 0.4, 0.4 },
  Purple1 = { 0.608, 0.19, 0.19 },
  Purple2 = { 0.57, 0.172, 0.172 },
  Purple3 = { 0.49, 0.15, 0.15 },
  Purple4 = { 0.332, 0.1, 0.1 },
  Red1 = { 1, 0, 0 },
  Red2 = { 0.932, 0, 0 },
  Red3 = { 0.804, 0, 0 },
  Red4 = { 0.545, 0, 0 },
  RosyBrown1 = { 1, 0.756, 0.756 },
  RosyBrown2 = { 0.932, 0.705, 0.705 },
  RosyBrown3 = { 0.804, 0.608, 0.608 },
  RosyBrown4 = { 0.545, 0.41, 0.41 },
  RoyalBlue1 = { 0.284, 0.464, 0.464 },
  RoyalBlue2 = { 0.264, 0.43, 0.43 },
  RoyalBlue3 = { 0.228, 0.372, 0.372 },
  RoyalBlue4 = { 0.152, 0.25, 0.25 },
  Salmon1 = { 1, 0.55, 0.55 },
  Salmon2 = { 0.932, 0.51, 0.51 },
  Salmon3 = { 0.804, 0.44, 0.44 },
  Salmon4 = { 0.545, 0.298, 0.298 },
  SeaGreen1 = { 0.33, 1, 1 },
  SeaGreen2 = { 0.305, 0.932, 0.932 },
  SeaGreen3 = { 0.264, 0.804, 0.804 },
  SeaGreen4 = { 0.18, 0.545, 0.545 },
  Seashell1 = { 1, 0.96, 0.96 },
  Seashell2 = { 0.932, 0.898, 0.898 },
  Seashell3 = { 0.804, 0.772, 0.772 },
  Seashell4 = { 0.545, 0.525, 0.525 },
  Sienna1 = { 1, 0.51, 0.51 },
  Sienna2 = { 0.932, 0.475, 0.475 },
  Sienna3 = { 0.804, 0.408, 0.408 },
  Sienna4 = { 0.545, 0.28, 0.28 },
  SkyBlue1 = { 0.53, 0.808, 0.808 },
  SkyBlue2 = { 0.494, 0.752, 0.752 },
  SkyBlue3 = { 0.424, 0.65, 0.65 },
  SkyBlue4 = { 0.29, 0.44, 0.44 },
  SlateBlue1 = { 0.512, 0.435, 0.435 },
  SlateBlue2 = { 0.48, 0.404, 0.404 },
  SlateBlue3 = { 0.41, 0.35, 0.35 },
  SlateBlue4 = { 0.28, 0.235, 0.235 },
  SlateGray1 = { 0.776, 0.888, 0.888 },
  SlateGray2 = { 0.725, 0.828, 0.828 },
  SlateGray3 = { 0.624, 0.712, 0.712 },
  SlateGray4 = { 0.424, 0.484, 0.484 },
  Snow1 = { 1, 0.98, 0.98 },
  Snow2 = { 0.932, 0.912, 0.912 },
  Snow3 = { 0.804, 0.79, 0.79 },
  Snow4 = { 0.545, 0.536, 0.536 },
  SpringGreen1 = { 0, 1, 1 },
  SpringGreen2 = { 0, 0.932, 0.932 },
  SpringGreen3 = { 0, 0.804, 0.804 },
  SpringGreen4 = { 0, 0.545, 0.545 },
  SteelBlue1 = { 0.39, 0.72, 0.72 },
  SteelBlue2 = { 0.36, 0.675, 0.675 },
  SteelBlue3 = { 0.31, 0.58, 0.58 },
  SteelBlue4 = { 0.21, 0.392, 0.392 },
  Tan1 = { 1, 0.648, 0.648 },
  Tan2 = { 0.932, 0.604, 0.604 },
  Tan3 = { 0.804, 0.52, 0.52 },
  Tan4 = { 0.545, 0.352, 0.352 },
  Thistle1 = { 1, 0.884, 0.884 },
  Thistle2 = { 0.932, 0.824, 0.824 },
  Thistle3 = { 0.804, 0.71, 0.71 },
  Thistle4 = { 0.545, 0.484, 0.484 },
  Tomato1 = { 1, 0.39, 0.39 },
  Tomato2 = { 0.932, 0.36, 0.36 },
  Tomato3 = { 0.804, 0.31, 0.31 },
  Tomato4 = { 0.545, 0.21, 0.21 },
  Turquoise1 = { 0, 0.96, 0.96 },
  Turquoise2 = { 0, 0.898, 0.898 },
  Turquoise3 = { 0, 0.772, 0.772 },
  Turquoise4 = { 0, 0.525, 0.525 },
  VioletRed1 = { 1, 0.244, 0.244 },
  VioletRed2 = { 0.932, 0.228, 0.228 },
  VioletRed3 = { 0.804, 0.196, 0.196 },
  VioletRed4 = { 0.545, 0.132, 0.132 },
  Wheat1 = { 1, 0.905, 0.905 },
  Wheat2 = { 0.932, 0.848, 0.848 },
  Wheat3 = { 0.804, 0.73, 0.73 },
  Wheat4 = { 0.545, 0.494, 0.494 },
  Yellow1 = { 1, 1, 1 },
  Yellow2 = { 0.932, 0.932, 0.932 },
  Yellow3 = { 0.804, 0.804, 0.804 },
  Yellow4 = { 0.545, 0.545, 0.545 },
  Gray0 = { 0.745, 0.745, 0.745 },
  Green0 = { 0, 1, 1 },
  Grey0 = { 0.745, 0.745, 0.745 },
  Maroon0 = { 0.69, 0.19, 0.19 },
  Purple0 = { 0.628, 0.125, 0.125 },
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

---https://github.com/Firanel/lua-color/blob/master/util/init.lua
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
        error 'Not a valid color'
      end
      local r, g, b, a = value:match(pattern)
      assert(r ~= nil, 'Not a valid color')
      self.r = tonumber(r, 16) / div
      self.g = tonumber(g, 16) / div
      self.b = tonumber(b, 16) / div
      self.a = a ~= nil and tonumber(a, 16) / div.a or 1

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
  ---`node.data` field of a PDF colorstock node.
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

local function print_color_table()
  for name, rgb in pairs(colors) do
    -- local color = Color({ r = rgb[1], g = rgb[2], b = rgb[3] })
    tex.print('\\par\\noindent')
    tex.print(
      '\\FarbeBox{rgba(' .. rgb[1] * 255 .. ', ' .. rgb[2] * 255 .. ', ' ..
        rgb[3] * 255 .. ', ' .. '1}')

    tex.print('\\quad{}' .. name)
  end
end

return {
  convert = convert,
  Color = Color --[[@as Color]] ,
  print_color_table = print_color_table,
}
