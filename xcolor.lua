
--- https://luarocks.org/modules/Firanel/lua-color
--- Copyright (c) 2021 Firanel

---https://github.com/Firanel/lua-color/blob/master/util/bitwise.lua
local function load_bitwise_functions()
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
end

--- https://github.com/Firanel/lua-color/blob/master/util/class.lua
local function load_class_function()

  --
  --------------------------------------------------------------------------------
  --         File:  class.lua
  --
  --        Usage:  ./class.lua
  --
  --  Description:
  --
  --      Options:  ---
  -- Requirements:  ---
  --         Bugs:  ---
  --        Notes:  ---
  --       Author:  YOUR NAME (), <>
  -- Organization:
  --      Version:  1.0
  --      Created:  15.04.2021
  --     Revision:  ---
  --------------------------------------------------------------------------------
  --

  local function class(base, init, defaults)
    local c = defaults or {}    -- a new class instance
    if not init and type(base) == 'function' then
      init = base
      base = nil
    elseif type(base) == 'table' then
    -- our new class is a shallow copy of the base class!
      for i,v in pairs(base) do
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
      setmetatable(obj,c)
      if init then
        init(obj,...)
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
        if m == klass then return true end
        m = m._base
      end
      return false
    end
    setmetatable(c, mt)
    return c
  end

  return class
end

---https://github.com/Firanel/lua-color/blob/master/util/init.lua
local function load_utils_functions()
  local function min_ind(first, ...)
    local min, ind = first, 1
    for i, v in ipairs {...} do
      if v < min then
        min, ind = v, i + 1
      end
    end
    return min, ind
  end

  local function max_ind(first, ...)
    local max, ind = first, 1
    for i, v in ipairs {...} do
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
end

--- https://github.com/Firanel/lua-color/blob/master/init.lua
local function load_main_color_class()

  --- Parse, convert and manipulate color values.
  --
  -- @classmod Color

  local utils = load_utils_functions()
  local class = load_class_function()

  -- Lua 5.1 compat
  local bitwise = load_bitwise_functions()
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
    if str:sub(-1) == "%" then
      return tonumber(str:sub(1, #str - 1)) / 100
    end
    return tonumber(str)
  end

  -- Color

  --- Color constructor.
  --
  -- @function Color:__call
  --
  -- @tparam ?string|table|Color value Color value (default: `nil`)
  --
  -- @see Color:set

  --- Red component.
  -- @field r

  --- Green component.
  -- @field g

  --- Blue component.
  -- @field b

  --- Alpha component.
  -- @field a

  --- Color class
  local Color = class(nil, function (this, value)
    if value then
      this:set(value)
    end
  end, {
    __is_color = true,
    r = 0,
    g = 0,
    b = 0,
    a = 1,
  })

  --- Table of color names.
  -- <br>
  -- Can be set to a table containing named colors to be used by `Color:set`
  -- <br>
  -- Values must be compatible with `Color:set`
  -- <br>
  -- Default: `nil`
  --
  -- @usage  Color.colorNames = { red = "#ff0000", green = "#00ff00", blue = "#0000ff" }
  --local color = Color "green"
  Color.colorNames = nil

  --- Clone color
  --
  -- @treturn Color copy
  function Color:clone()
    return Color(self)
  end

  --- Set color to value.
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
  --
  -- @see Color:__call
  --
  -- @tparam string|table|Color value Color
  --
  -- @treturn Color self
  --
  -- @usage color:set "#f1f1f1"
  -- @usage color:set "rgba(241, 241, 241, 0.5)"
  -- @usage color:set "hsl 180 100% 20%"
  -- @usage color:set { r = 0.255, g = 0.729, b = 0.412 }
  -- @usage color:set { 0.255, 0.729, 0.412 } -- same as above
  -- @usage color:set { h = 0.389, s = 0.65, v = 0.73 }
  function Color:set(value)
    assert(value)

    -- from Color
    if value.__is_color then
      self.r = value.r
      self.g = value.g
      self.b = value.b
      self.a = value.a

    elseif type(value) == "string" then
      self.a = 1

      if value:sub(1, 1) ~= "#" then
        if Color.colorNames then
          local c = Color.colorNames[value]
          if c then return self:set(c) end
        end

        local func, values = value:match "(%w+)[ %(]+([x ,.%x%%]+)"
        if func ~= nil then
          if func == "rgb" then
            local r, g, b = values:match "([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+)"
            assert(r and g and b)
            self.r = tonumber(r) / 0xff
            self.g = tonumber(g) / 0xff
            self.b = tonumber(b) / 0xff
            return self
          elseif func == "rgba" then
            local r, g, b, a = values:match "([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+)[ ,]+([x.%x]+%%?)"
            assert(r and g and b and a)
            self.r = tonumber(r) / 0xff
            self.g = tonumber(g) / 0xff
            self.b = tonumber(b) / 0xff
            self.a = tonumPercent(a)
            return self
          elseif func == "hsv" then
            local h, s, v = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and s and v)
            return self:set {
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              v = tonumPercent(v),
            }
          elseif func == "hsva" then
            local h, s, v, a = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and s and v and a)
            return self:set {
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              v = tonumPercent(v),
              a = tonumPercent(a)
            }
          elseif func == "hsl" then
            local h, s, l = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and s and l)
            return self:set {
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              l = tonumPercent(l),
            }
          elseif func == "hsla" then
            local h, s, v, a = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and s and v and a)
            return self:set {
              h = tonumber(h) / 360,
              s = tonumPercent(s),
              l = tonumPercent(l),
              a = tonumPercent(a)
            }
          elseif func == "hwb" then
            local h, w, b = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and w and b)
            return self:set {
              h = tonumber(h) / 360,
              w = tonumPercent(w),
              b = tonumPercent(b),
            }
          elseif func == "hwba" then
            local h, w, b, a = values:match "([x.%x]+)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(h and w and b and a)
            return self:set {
              h = tonumber(h) / 360,
              w = tonumPercent(w),
              b = tonumPercent(b),
              a = tonumPercent(a)
            }
          elseif func == "cmyk" then
            local c, m, y, k = values:match "([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
            assert(c and m and y and k)
            return self:set {
              c = tonumPercent(c),
              m = tonumPercent(m),
              y = tonumPercent(y),
              k = tonumPercent(k),
            }
          end
        else
          local col, dist, w, b, a = value:match "([RGBCMYrgbcmy])(%d*)[, ]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
          if col == nil then
            col, dist, w, b, a = value:match "([RGBCMYrgbcmy])(%d*)[, ]+([x.%x]+%%?)[ ,]+([x.%x]+%%?)"
          end
          if col then
            col = col:lower()

            local h
            if     col == "r" then h = 0
            elseif col == "y" then h = 1/6
            elseif col == "g" then h = 2/6
            elseif col == "c" then h = 3/6
            elseif col == "b" then h = 4/6
            elseif col == "m" then h = 5/6 end

            if #dist > 0 then h = h + tonumber(dist) / 600 end

            return self:set {
              h = h,
              w = tonumPercent(w),
              b = tonumPercent(b),
              a = a and tonumPercent(a) or 1
            }
          end
        end
      else
        value = value:sub(2)
      end

      local pattern
      local div = 0xff
      if #value == 3 then
        pattern = "(%x)(%x)(%x)"
        div = 0xf
      elseif #value == 4 then
        pattern = "(%x)(%x)(%x)(%x)"
        div = 0xf
      elseif #value == 6 then
        pattern = "(%x%x)(%x%x)(%x%x)"
      elseif #value == 8 then
        pattern = "(%x%x)(%x%x)(%x%x)(%x%x)"
      else
        error "Not a valid color"
      end
      local r, g, b, a = value:match(pattern)
      assert(r ~= nil, "Not a valid color")
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
      local k = 1 - value.k
      self.r = (1 - value.c) * k
      self.g = (1 - value.m) * k
      self.b = (1 - value.y) * k
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
      if value.red then self.r = value.red end
      if value.green then self.g = value.green end
      if value.blue then self.b = value.blue end
      if value.alpha then self.a = value.alpha end

      if value.lightness then
        local h, s, l = self:hsl()
        self:set {h= value.hue or h, s= value.saturation or s, l= value.lightness or l}
        value.hue = nil
        value.saturation = nil
      end

      if value.whiteness or value.blackness then
        local h, w, b = self:hwb()
        self:set {h= value.hue or h, w= value.whiteness or w, b= value.backness or b}
        value.hue = nil
      end

      if value.hue or value.saturation or value.value then
        local h, s, v = self:hsv()
        self:set {h= value.hue or h, s= value.saturation or s, v= value.value or v}
      end

      if value.cyan or value.magenta or value.yellow or value.key then
        local c, m, y, k = self:cmyk()
        self:set {
          c = value.cyan or c,
          m = value.magenta or m,
          y = value.yellow or y,
          k = value.key or k
        }
      end
    end

    local r, g, b, a =
      utils.clamp(self.r, 0, 1),
      utils.clamp(self.g, 0, 1),
      utils.clamp(self.b, 0, 1),
      utils.clamp(self.a, 0, 1)
    assert(r and g and b and a, "Color invalid")
    return self
  end

  --- Get rgb values.
  --
  -- @treturn number[0;1] red
  -- @treturn number[0;1] green
  -- @treturn number[0;1] blue
  function Color:rgb()
    return self.r, self.g, self.b
  end

  --- Get rgba values.
  --
  -- @treturn number[0;1] red
  -- @treturn number[0;1] green
  -- @treturn number[0;1] blue
  -- @treturn number[0;1] alpha
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
      hue = (    (g - b) / chroma) / 6
    elseif max_i == 2 then
      hue = (2 + (b - r) / chroma) / 6
    elseif max_i == 3 then
      hue = (4 + (r - g) / chroma) / 6
    end

    local saturation = max == 0 and 0 or chroma / max

    return hue, saturation, max, min
  end

  --- Get hsv values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] saturation
  -- @treturn number[0;1] value
  function Color:hsv()
    local h, s, v = self:_hsvm()
    return h, s, v
  end

  --- Get hsv values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] saturation
  -- @treturn number[0;1] value
  -- @treturn number[0;1] alpha
  function Color:hsva()
    local h, s, v = self:_hsvm()
    return h, s, v, self.a
  end

  --- Get hsl values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] saturation
  -- @treturn number[0;1] lightness
  function Color:hsl()
    local hue, _, max, min = self:_hsvm()
    local lightness = (max + min) / 2

    local saturation = lightness == 0 and 0
      or (max - lightness) / math.min(lightness, 1 - lightness)

    if saturation ~= saturation then
      saturation = 0
    end

    return hue, saturation, lightness
  end

  --- Get hsl values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] saturation
  -- @treturn number[0;1] lightness
  -- @treturn number[0;1] alpha
  function Color:hsla()
    local h, s, l = self:hsl()
    return h, s, l, self.a
  end

  --- Get hwb values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] whiteness
  -- @treturn number[0;1] blackness
  function Color:hwb()
    local h, s, v = self:hsv()
    local w = (1 - s) * v
    local b = 1 - v
    return h, w, b
  end

  --- Get hwb values.
  --
  -- @treturn number[0;1] hue
  -- @treturn number[0;1] whiteness
  -- @treturn number[0;1] blackness
  -- @treturn number[0;1] alpha
  function Color:hwba()
    local h, w, b = self:hwb()
    return h, w, b, self.a
  end

  --- Get cmyk values.
  --
  -- @treturn number[0;1] cyan
  -- @treturn number[0;1] magenta
  -- @treturn number[0;1] yellow
  -- @treturn number[0;1] key
  function Color:cmyk()
    local r, g, b = self.r, self.g, self.b
    local K = math.max(r, g, b)
    local k = 1 - K
    local c = (K - r) / K
    local m = (K - g) / K
    local y = (K - b) / K
    return c, m, y, k
  end

  --- Rotate hue of color.
  --
  -- @tparam number[0;1]|table value Part of full turn or table containing degree or radians
  --
  -- @treturn Color self
  --
  -- @usage color:rotate(0.5)
  -- @usage color:rotate {deg=180}
  -- @usage color:rotate {rad=math.pi}
  function Color:rotate(value)
    local r
    if type(value) == "number" then
      r = value
    elseif value.rad ~= nil then
      r = value.rad / (math.pi * 2)
    elseif value.deg ~= nil then
      r = value.deg / 360
    else
      error("No valid argument")
    end

    local h, s, v = self:hsv()
    h = (h + r) % 1
    self:set {h = h, s = s, v = v, a = self.a}

    return self
  end

  --- Invert the color.
  --
  -- @treturn Color self
  function Color:invert()
    self.r = 1 - self.r
    self.g = 1 - self.g
    self.b = 1 - self.b
    return self
  end

  --- Reduce saturation to 0.
  --
  -- @treturn Color self
  function Color:grey()
    local h, _, v = self:hsv()
    self:set {h=h, s=0, v=v, a=self.a}
    return self
  end

  --- Set to black or white depending on lightness.
  --
  -- @tparam ?number[0;1] lightness Cutoff point (Default: 0.5)
  --
  -- @treturn Color self
  function Color:blackOrWhite(lightness)
    local _, _, l = self:hsl()
    local v = l > lightness and 1 or 0
    self.r = v
    self.g = v
    self.b = v
    return self
  end

  --- Mix two colors together.
  --
  -- @tparam Color other
  -- @tparam ?number strength 0 results in self, 1 results in other (Default: 0.5)
  --
  -- @treturn Color self
  function Color:mix(other, strength)
    if strength == nil then strength = 0.5 end
    self.r = self.r * (1 - strength) + other.r * strength
    self.g = self.g * (1 - strength) + other.g * strength
    self.b = self.b * (1 - strength) + other.b * strength
    self.a = self.a * (1 - strength) + other.a * strength
    return self
  end

  --- Generate complementary color.
  --
  -- @treturn Color
  function Color:complement()
    return Color(self):rotate(0.5)
  end

  --- Generate analogous color scheme.
  --
  -- @treturn Color
  -- @treturn Color self
  -- @treturn Color
  function Color:analogous()
    local h, s, v = self:hsv()
    return Color {h = (h - 1/12) % 1, s = s, v = v, a = self.a},
      self,
      Color {h = (h + 1/12) % 1, s = s, v = v, a = self.a}
  end

  --- Generate triadic color scheme.
  --
  -- @treturn Color self
  -- @treturn Color
  -- @treturn Color
  function Color:triad()
    local h, s, v = self:hsv()
    return self,
      Color {h = (h + 1/3) % 1, s = s, v = v, a = self.a},
      Color {h = (h + 2/3) % 1, s = s, v = v, a = self.a}
  end

  --- Generate tetradic color scheme.
  --
  -- @treturn Color self
  -- @treturn Color
  -- @treturn Color
  -- @treturn Color
  function Color:tetrad()
    local h, s, v = self:hsv()
    return self,
      Color {h = (h + 1/4) % 1, s = s, v = v, a = self.a},
      Color {h = (h + 2/4) % 1, s = s, v = v, a = self.a},
      Color {h = (h + 3/4) % 1, s = s, v = v, a = self.a}
  end

  --- Generate compound color scheme.
  --
  -- @treturn Color
  -- @treturn Color self
  -- @treturn Color
  function Color:compound()
    local ca, _, cb = self:complement():analogous()
    return ca, self, cb
  end

  --- Generate evenly spaced color scheme.
  -- <br>
  -- Generalization of `triad` and `tetrad`.
  --
  -- @tparam int     n Return n colors
  -- @tparam ?number r Space colors over r rotations (Default: 1)
  --
  -- @treturn {Color,...} Table with n colors including self at index 1
  function Color:evenlySpaced(n, r)
    assert(n > 0, "n needs to be greater than 0")
    r = r or 1

    local res = {self}

    local rot = r / n
    local h, s, v = self:hsv()
    local a = self.a

    for i = 1, n - 1 do
      h = (h + rot) % 1
      table.insert(res, Color {h=h, s=s, v=v, a=a})
    end

    return res
  end

  --- Get string representation of color.
  --
  -- If `format` is `nil`, `color:tostring()` is the same as `tostring(color)`.
  --
  -- @tparam ?string format One of: `#fff`, `#ffff`, `#ffffff`, `#ffffffff`,
  --  rgb, rgba, hsv, hsva, hsl, hsla, hwb, hwba, ncol, cmyk
  --
  -- @treturn string
  --
  -- @see Color:__tostring
  function Color:tostring(format)
    if format == nil then return tostring(self) end

    format = format:lower()

    if format:sub(1,1) == "#" then
      if #format == 4 then
        return string.format("#%x%x%x", utils.round(self.r * 0xf),
          utils.round(self.g * 0xf), utils.round(self.b * 0xf))
      elseif #format == 5 then
        return string.format("#%x%x%x%x", utils.round(self.r * 0xf),
          utils.round(self.g * 0xf), utils.round(self.b * 0xf), utils.round(self.a * 0xf))
      elseif #format == 7 then
        return string.format("#%02x%02x%02x", utils.round(self.r * 0xff),
          utils.round(self.g * 0xff), utils.round(self.b * 0xff))
      elseif #format == 9 then
        return string.format("#%02x%02x%02x%02x", utils.round(self.r * 0xff),
          utils.round(self.g * 0xff), utils.round(self.b * 0xff), utils.round(self.a * 0xff))
      end
    elseif format == "rgb" then
      return string.format("rgb(%d, %d, %d)",
        utils.round(self.r * 0xff),
        utils.round(self.g * 0xff),
        utils.round(self.b * 0xff))
    elseif format == "rgba" then
      return string.format("rgba(%d, %d, %d, %s)",
        utils.round(self.r * 0xff),
        utils.round(self.g * 0xff),
        utils.round(self.b * 0xff), self.a)
    elseif format == "hsv" then
      local h, s, v = self:hsv()
      return string.format("hsv(%d, %d%%, %d%%)",
        utils.round(h * 360),
        utils.round(s * 100),
        utils.round(v * 100))
    elseif format == "hsva" then
      local h, s, v, a = self:hsva()
      return string.format("hsva(%d, %d%%, %d%%, %s)",
        utils.round(h * 360),
        utils.round(s * 100),
        utils.round(v * 100), a)
    elseif format == "hsl" then
      local h, s, l = self:hsl()
      return string.format("hsl(%d, %d%%, %d%%)",
        utils.round(h * 360),
        utils.round(s * 100),
        utils.round(l * 100))
    elseif format == "hsla" then
      local h, s, l, a = self:hsla()
      return string.format("hsla(%d, %d%%, %d%%, %s)",
        utils.round(h * 360),
        utils.round(s * 100),
        utils.round(l * 100), a)
    elseif format == "hwb" then
      local h, w, b = self:hwb()
      return string.format("hwb(%d, %d%%, %d%%)",
        utils.round(h * 360),
        utils.round(w * 100),
        utils.round(b * 100))
    elseif format == "hwba" then
      local h, w, b, a = self:hwba()
      return string.format("hwba(%d, %d%%, %d%%, %s)",
        utils.round(h * 360),
        utils.round(w * 100),
        utils.round(b * 100), a)
    elseif format == "ncol" then
      local h, w, b = self:hwb()
      local h_maj, h_min = math.modf(h * 6)
      h_maj = h_maj % 6

      local col
      if h_maj == 0 then col = "R"
      elseif h_maj == 1 then col = "Y"
      elseif h_maj == 2 then col = "G"
      elseif h_maj == 3 then col = "C"
      elseif h_maj == 4 then col = "B"
      else col = "M" end

      return string.format("%s%d, %d%%, %d%%",
        col, utils.round(h_min * 100),
        utils.round(w * 100),
        utils.round(b * 100))
    elseif format == "cmyk" then
      local c, m, y, k = self:cmyk()
      return string.format("cymk(%d%%, %d%%, %d%%, %d%%)",
        utils.round(c * 100),
        utils.round(m * 100),
        utils.round(y * 100),
        utils.round(k * 100))
    end

    return tostring(self)
  end

  --- Get color in rgb hex notation.
  -- <br>
  -- only adds alpha value if `color.a < 1`
  --
  -- @treturn string `#rrggbb` | `#rrggbbaa`
  --
  -- @see Color:tostring
  function Color:__tostring()
    if self.a < 1 then
      return string.format(
        "#%02x%02x%02x%02x",
        utils.round(self.r * 0xff),
        utils.round(self.g * 0xff),
        utils.round(self.b * 0xff),
        utils.round(self.a * 0xff)
      )
    else
      return string.format(
        "#%02x%02x%02x",
        utils.round(self.r * 0xff),
        utils.round(self.g * 0xff),
        utils.round(self.b * 0xff)
      )
    end
  end

  --- Check if colors are equal.
  --
  -- @tparam Color other
  --
  -- @treturn boolean all values are equal
  function Color:__eq(other)
    return self.r == other.r
      and self.g == other.g
      and self.b == other.b
      and self.a == other.a
  end

  --- Checks whether color is darker.
  --
  -- @tparam Color other
  --
  -- @treturn boolean self is darker than other
  function Color:__lt(other)
    local _, _, la = self:hsl()
    local _, _, lb = other:hsl()
    return la < lb
  end

  --- Checks whether color is as dark or darker.
  --
  -- @tparam Color other
  --
  -- @treturn boolean self is as dark or darker than other
  function Color:__le(other)
    local _, _, la = self:hsl()
    local _, _, lb = other:hsl()
    return la <= lb
  end

  --- Iterate through color.
  --
  -- Iterates through r, g, b, and a.
  function Color:__pairs()
    local function iter(tbl, k)
      if k == nil then
        return "r", self.r
      elseif k == "r" then
        return "g", self.g
      elseif k == "g" then
        return "b", self.b
      elseif k == "b" then
        return "a", self.a
      end
    end

    return iter, self, nil
  end

  --- Get inverted clone of color.
  --
  -- @treturn Color
  function Color:__unm()
    return Color(self):invert()
  end

  --- Mix two colors evenly.
  --
  -- @tparam Color a first color
  -- @tparam Color b second color
  --
  -- @treturn Color new color
  --
  -- @see Color:mix
  function Color.__add(a, b)
    assert(Color.isColor(a) and Color.isColor(b), "Can only add two colors.")
    return Color(a):mix(b)
  end

  --- Complement of even mix.
  --
  -- @tparam Color a first color
  -- @tparam Color b second color
  --
  -- @treturn Color new color
  --
  -- @see Color:mix
  -- @see Color.__add
  function Color.__sub(a, b)
    assert(Color.isColor(a) and Color.isColor(b), "Can only add two colors.")
    return Color(a):mix(b):rotate(0.5)
  end

  --- Apply rgb mask to color.
  --
  -- @tparam Color|number a color or mask
  -- @tparam Color|number b color or mask (if a and b are colors b is used as mask)
  --
  -- @treturn Color new color
  --
  -- @usage local new_col = color & 0xff00ff -- get new color without the green channel
  function Color.__band(a, b)
    local color, mask
    if Color.isColor(a) and type(b) == "number" then
      color = a
      mask = b
    elseif Color.isColor(b) and type(a) == "number" then
      color = b
      mask = a
    elseif Color.isColor(a) and Color.isColor(b) then
      color = a
      mask = bit_lshift(utils.round(b.r * 0xff), 16)
        + bit_lshift(utils.round(b.g * 0xff), 8)
        + utils.round(b.b * 0xff)
    else
      error("Required arguments: Color|number,Color|number Received: "..type(a)..","..type(b))
    end

    return Color {
      bit_and(utils.round(color.r * 0xff), bit_rshift(mask, 16)) / 0xff,
      bit_and(utils.round(color.g * 0xff), bit_rshift(mask,  8)) / 0xff,
      bit_and(utils.round(color.b * 0xff), mask                ) / 0xff,
      color.a
    }
  end

  --- Apply rgb mask to color, providing backwards compatibility for Lua 5.1 and LuaJIT 2.1.0-beta3 (e.g. inside Neovim), which don't provide native support for bitwise operators.
  --
  -- @tparam Color|number a color or mask
  -- @tparam Color|number b color or mask (if a and b are colors b is used as mask)
  --
  -- @treturn Color new color
  --
  -- @usage local new_col = Color.band(color, 0xff00ff) -- get new color without the green channel
  function Color.band(a, b)
      return Color.__band(a, b)
  end

  --- Check whether `color` is a Color.
  --
  -- @param color
  --
  -- @treturn boolean is a color
  --
  -- @usage if Color.isColor(color) then print "It's a color!" end
  function Color.isColor(color)
    return color ~= nil and color.__is_color == true
  end

  return Color

end

local Color = load_main_color_class()

-- https://github.com/latex3/xcolor/blob/main/xcolor.dtx

local svgName = {
  AliceBlue = { .94, .972, .972 },
  AntiqueWhite = { .98, .92, .92 },
  Aqua = { 0, 1, 1 },
  Aquamarine = { .498, 1, 1 },
  Azure = { .94, 1, 1 },
  Beige = { .96, .96, .96 },
  Bisque = { 1, .894, .894 },
  Black = { 0, 0, 0 },
  BlanchedAlmond = { 1, .92, .92 },
  Blue = { 0, 0, 0 },
  BlueViolet = { .54, .17, .17 },
  Brown = { .648, .165, .165 },
  BurlyWood = { .87, .72, .72 },
  CadetBlue = { .372, .62, .62 },
  Chartreuse = { .498, 1, 1 },
  Chocolate = { .824, .41, .41 },
  Coral = { 1, .498, .498 },
  CornflowerBlue = { .392, .585, .585 },
  Cornsilk = { 1, .972, .972 },
  Crimson = { .864, .08, .08 },
  Cyan = { 0, 1, 1 },
  DarkBlue = { 0, 0, 0 },
  DarkCyan = { 0, .545, .545 },
  DarkGoldenrod = { .72, .525, .525 },
  DarkGray = { .664, .664, .664 },
  DarkGreen = { 0, .392, .392 },
  DarkGrey = { .664, .664, .664 },
  DarkKhaki = { .74, .716, .716 },
  DarkMagenta = { .545, 0, 0 },
  DarkOliveGreen = { .332, .42, .42 },
  DarkOrange = { 1, .55, .55 },
  DarkOrchid = { .6, .196, .196 },
  DarkRed = { .545, 0, 0 },
  DarkSalmon = { .912, .59, .59 },
  DarkSeaGreen = { .56, .736, .736 },
  DarkSlateBlue = { .284, .24, .24 },
  DarkSlateGray = { .185, .31, .31 },
  DarkSlateGrey = { .185, .31, .31 },
  DarkTurquoise = { 0, .808, .808 },
  DarkViolet = { .58, 0, 0 },
  DeepPink = { 1, .08, .08 },
  DeepSkyBlue = { 0, .75, .75 },
  DimGray = { .41, .41, .41 },
  DimGrey = { .41, .41, .41 },
  DodgerBlue = { .116, .565, .565 },
  FireBrick = { .698, .132, .132 },
  FloralWhite = { 1, .98, .98 },
  ForestGreen = { .132, .545, .545 },
  Fuchsia = { 1, 0, 0 },
  Gainsboro = { .864, .864, .864 },
  GhostWhite = { .972, .972, .972 },
  Gold = { 1, .844, .844 },
  Goldenrod = { .855, .648, .648 },
  Gray = { .5, .5, .5 },
  Green = { 0, .5, .5 },
  GreenYellow = { .68, 1, 1 },
  Grey = { .5, .5, .5 },
  Honeydew = { .94, 1, 1 },
  HotPink = { 1, .41, .41 },
  IndianRed = { .804, .36, .36 },
  Indigo = { .294, 0, 0 },
  Ivory = { 1, 1, 1 },
  Khaki = { .94, .9, .9 },
  Lavender = { .9, .9, .9 },
  LavenderBlush = { 1, .94, .94 },
  LawnGreen = { .488, .99, .99 },
  LemonChiffon = { 1, .98, .98 },
  LightBlue = { .68, .848, .848 },
  LightCoral = { .94, .5, .5 },
  LightCyan = { .88, 1, 1 },
  LightGoldenrod = { .933, .867, .867 },
  LightGoldenrodYellow = { .98, .98, .98 },
  LightGray = { .828, .828, .828 },
  LightGreen = { .565, .932, .932 },
  LightGrey = { .828, .828, .828 },
  LightPink = { 1, .712, .712 },
  LightSalmon = { 1, .628, .628 },
  LightSeaGreen = { .125, .698, .698 },
  LightSkyBlue = { .53, .808, .808 },
  LightSlateBlue = { .518, .44, .44 },
  LightSlateGray = { .468, .532, .532 },
  LightSlateGrey = { .468, .532, .532 },
  LightSteelBlue = { .69, .77, .77 },
  LightYellow = { 1, 1, 1 },
  Lime = { 0, 1, 1 },
  LimeGreen = { .196, .804, .804 },
  Linen = { .98, .94, .94 },
  Magenta = { 1, 0, 0 },
  Maroon = { .5, 0, 0 },
  MediumAquamarine = { .4, .804, .804 },
  MediumBlue = { 0, 0, 0 },
  MediumOrchid = { .73, .332, .332 },
  MediumPurple = { .576, .44, .44 },
  MediumSeaGreen = { .235, .7, .7 },
  MediumSlateBlue = { .484, .408, .408 },
  MediumSpringGreen = { 0, .98, .98 },
  MediumTurquoise = { .284, .82, .82 },
  MediumVioletRed = { .78, .084, .084 },
  MidnightBlue = { .098, .098, .098 },
  MintCream = { .96, 1, 1 },
  MistyRose = { 1, .894, .894 },
  Moccasin = { 1, .894, .894 },
  NavajoWhite = { 1, .87, .87 },
  Navy = { 0, 0, 0 },
  NavyBlue = { 0, 0, 0 },
  OldLace = { .992, .96, .96 },
  Olive = { .5, .5, .5 },
  OliveDrab = { .42, .556, .556 },
  Orange = { 1, .648, .648 },
  OrangeRed = { 1, .27, .27 },
  Orchid = { .855, .44, .44 },
  PaleGoldenrod = { .932, .91, .91 },
  PaleGreen = { .596, .985, .985 },
  PaleTurquoise = { .688, .932, .932 },
  PaleVioletRed = { .86, .44, .44 },
  PapayaWhip = { 1, .936, .936 },
  PeachPuff = { 1, .855, .855 },
  Peru = { .804, .52, .52 },
  Pink = { 1, .752, .752 },
  Plum = { .868, .628, .628 },
  PowderBlue = { .69, .88, .88 },
  Purple = { .5, 0, 0 },
  Red = { 1, 0, 0 },
  RosyBrown = { .736, .56, .56 },
  RoyalBlue = { .255, .41, .41 },
  SaddleBrown = { .545, .27, .27 },
  Salmon = { .98, .5, .5 },
  SandyBrown = { .956, .644, .644 },
  SeaGreen = { .18, .545, .545 },
  Seashell = { 1, .96, .96 },
  Sienna = { .628, .32, .32 },
  Silver = { .752, .752, .752 },
  SkyBlue = { .53, .808, .808 },
  SlateBlue = { .415, .352, .352 },
  SlateGray = { .44, .5, .5 },
  SlateGrey = { .44, .5, .5 },
  Snow = { 1, .98, .98 },
  SpringGreen = { 0, 1, 1 },
  SteelBlue = { .275, .51, .51 },
  Tan = { .824, .705, .705 },
  Teal = { 0, .5, .5 },
  Thistle = { .848, .75, .75 },
  Tomato = { 1, .39, .39 },
  Turquoise = { .25, .88, .88 },
  Violet = { .932, .51, .51 },
  VioletRed = { .816, .125, .125 },
  Wheat = { .96, .87, .87 },
  White = { 1, 1, 1 },
  WhiteSmoke = { .96, .96, .96 },
  Yellow = { 1, 1, 1 },
  YellowGreen = { .604, .804, .804 },
}

local x11names = {
  AntiqueWhite1 = { 1, .936, .936 },
  AntiqueWhite2 = { .932, .875, .875 },
  AntiqueWhite3 = { .804, .752, .752 },
  AntiqueWhite4 = { .545, .512, .512 },
  Aquamarine1 = { .498, 1, 1 },
  Aquamarine2 = { .464, .932, .932 },
  Aquamarine3 = { .4, .804, .804 },
  Aquamarine4 = { .27, .545, .545 },
  Azure1 = { .94, 1, 1 },
  Azure2 = { .88, .932, .932 },
  Azure3 = { .756, .804, .804 },
  Azure4 = { .512, .545, .545 },
  Bisque1 = { 1, .894, .894 },
  Bisque2 = { .932, .835, .835 },
  Bisque3 = { .804, .716, .716 },
  Bisque4 = { .545, .49, .49 },
  Blue1 = { 0, 0, 0 },
  Blue2 = { 0, 0, 0 },
  Blue3 = { 0, 0, 0 },
  Blue4 = { 0, 0, 0 },
  Brown1 = { 1, .25, .25 },
  Brown2 = { .932, .23, .23 },
  Brown3 = { .804, .2, .2 },
  Brown4 = { .545, .136, .136 },
  Burlywood1 = { 1, .828, .828 },
  Burlywood2 = { .932, .772, .772 },
  Burlywood3 = { .804, .668, .668 },
  Burlywood4 = { .545, .45, .45 },
  CadetBlue1 = { .596, .96, .96 },
  CadetBlue2 = { .556, .898, .898 },
  CadetBlue3 = { .48, .772, .772 },
  CadetBlue4 = { .325, .525, .525 },
  Chartreuse1 = { .498, 1, 1 },
  Chartreuse2 = { .464, .932, .932 },
  Chartreuse3 = { .4, .804, .804 },
  Chartreuse4 = { .27, .545, .545 },
  Chocolate1 = { 1, .498, .498 },
  Chocolate2 = { .932, .464, .464 },
  Chocolate3 = { .804, .4, .4 },
  Chocolate4 = { .545, .27, .27 },
  Coral1 = { 1, .448, .448 },
  Coral2 = { .932, .415, .415 },
  Coral3 = { .804, .356, .356 },
  Coral4 = { .545, .244, .244 },
  Cornsilk1 = { 1, .972, .972 },
  Cornsilk2 = { .932, .91, .91 },
  Cornsilk3 = { .804, .785, .785 },
  Cornsilk4 = { .545, .532, .532 },
  Cyan1 = { 0, 1, 1 },
  Cyan2 = { 0, .932, .932 },
  Cyan3 = { 0, .804, .804 },
  Cyan4 = { 0, .545, .545 },
  DarkGoldenrod1 = { 1, .725, .725 },
  DarkGoldenrod2 = { .932, .68, .68 },
  DarkGoldenrod3 = { .804, .585, .585 },
  DarkGoldenrod4 = { .545, .396, .396 },
  DarkOliveGreen1 = { .792, 1, 1 },
  DarkOliveGreen2 = { .736, .932, .932 },
  DarkOliveGreen3 = { .635, .804, .804 },
  DarkOliveGreen4 = { .43, .545, .545 },
  DarkOrange1 = { 1, .498, .498 },
  DarkOrange2 = { .932, .464, .464 },
  DarkOrange3 = { .804, .4, .4 },
  DarkOrange4 = { .545, .27, .27 },
  DarkOrchid1 = { .75, .244, .244 },
  DarkOrchid2 = { .698, .228, .228 },
  DarkOrchid3 = { .604, .196, .196 },
  DarkOrchid4 = { .408, .132, .132 },
  DarkSeaGreen1 = { .756, 1, 1 },
  DarkSeaGreen2 = { .705, .932, .932 },
  DarkSeaGreen3 = { .608, .804, .804 },
  DarkSeaGreen4 = { .41, .545, .545 },
  DarkSlateGray1 = { .592, 1, 1 },
  DarkSlateGray2 = { .552, .932, .932 },
  DarkSlateGray3 = { .475, .804, .804 },
  DarkSlateGray4 = { .32, .545, .545 },
  DeepPink1 = { 1, .08, .08 },
  DeepPink2 = { .932, .07, .07 },
  DeepPink3 = { .804, .064, .064 },
  DeepPink4 = { .545, .04, .04 },
  DeepSkyBlue1 = { 0, .75, .75 },
  DeepSkyBlue2 = { 0, .698, .698 },
  DeepSkyBlue3 = { 0, .604, .604 },
  DeepSkyBlue4 = { 0, .408, .408 },
  DodgerBlue1 = { .116, .565, .565 },
  DodgerBlue2 = { .11, .525, .525 },
  DodgerBlue3 = { .094, .455, .455 },
  DodgerBlue4 = { .064, .305, .305 },
  Firebrick1 = { 1, .19, .19 },
  Firebrick2 = { .932, .172, .172 },
  Firebrick3 = { .804, .15, .15 },
  Firebrick4 = { .545, .1, .1 },
  Gold1 = { 1, .844, .844 },
  Gold2 = { .932, .79, .79 },
  Gold3 = { .804, .68, .68 },
  Gold4 = { .545, .46, .46 },
  Goldenrod1 = { 1, .756, .756 },
  Goldenrod2 = { .932, .705, .705 },
  Goldenrod3 = { .804, .608, .608 },
  Goldenrod4 = { .545, .41, .41 },
  Green1 = { 0, 1, 1 },
  Green2 = { 0, .932, .932 },
  Green3 = { 0, .804, .804 },
  Green4 = { 0, .545, .545 },
  Honeydew1 = { .94, 1, 1 },
  Honeydew2 = { .88, .932, .932 },
  Honeydew3 = { .756, .804, .804 },
  Honeydew4 = { .512, .545, .545 },
  HotPink1 = { 1, .43, .43 },
  HotPink2 = { .932, .415, .415 },
  HotPink3 = { .804, .376, .376 },
  HotPink4 = { .545, .228, .228 },
  IndianRed1 = { 1, .415, .415 },
  IndianRed2 = { .932, .39, .39 },
  IndianRed3 = { .804, .332, .332 },
  IndianRed4 = { .545, .228, .228 },
  Ivory1 = { 1, 1, 1 },
  Ivory2 = { .932, .932, .932 },
  Ivory3 = { .804, .804, .804 },
  Ivory4 = { .545, .545, .545 },
  Khaki1 = { 1, .965, .965 },
  Khaki2 = { .932, .9, .9 },
  Khaki3 = { .804, .776, .776 },
  Khaki4 = { .545, .525, .525 },
  LavenderBlush1 = { 1, .94, .94 },
  LavenderBlush2 = { .932, .88, .88 },
  LavenderBlush3 = { .804, .756, .756 },
  LavenderBlush4 = { .545, .512, .512 },
  LemonChiffon1 = { 1, .98, .98 },
  LemonChiffon2 = { .932, .912, .912 },
  LemonChiffon3 = { .804, .79, .79 },
  LemonChiffon4 = { .545, .536, .536 },
  LightBlue1 = { .75, .936, .936 },
  LightBlue2 = { .698, .875, .875 },
  LightBlue3 = { .604, .752, .752 },
  LightBlue4 = { .408, .512, .512 },
  LightCyan1 = { .88, 1, 1 },
  LightCyan2 = { .82, .932, .932 },
  LightCyan3 = { .705, .804, .804 },
  LightCyan4 = { .48, .545, .545 },
  LightGoldenrod1 = { 1, .925, .925 },
  LightGoldenrod2 = { .932, .864, .864 },
  LightGoldenrod3 = { .804, .745, .745 },
  LightGoldenrod4 = { .545, .505, .505 },
  LightPink1 = { 1, .684, .684 },
  LightPink2 = { .932, .635, .635 },
  LightPink3 = { .804, .55, .55 },
  LightPink4 = { .545, .372, .372 },
  LightSalmon1 = { 1, .628, .628 },
  LightSalmon2 = { .932, .585, .585 },
  LightSalmon3 = { .804, .505, .505 },
  LightSalmon4 = { .545, .34, .34 },
  LightSkyBlue1 = { .69, .888, .888 },
  LightSkyBlue2 = { .644, .828, .828 },
  LightSkyBlue3 = { .552, .712, .712 },
  LightSkyBlue4 = { .376, .484, .484 },
  LightSteelBlue1 = { .792, .884, .884 },
  LightSteelBlue2 = { .736, .824, .824 },
  LightSteelBlue3 = { .635, .71, .71 },
  LightSteelBlue4 = { .43, .484, .484 },
  LightYellow1 = { 1, 1, 1 },
  LightYellow2 = { .932, .932, .932 },
  LightYellow3 = { .804, .804, .804 },
  LightYellow4 = { .545, .545, .545 },
  Magenta1 = { 1, 0, 0 },
  Magenta2 = { .932, 0, 0 },
  Magenta3 = { .804, 0, 0 },
  Magenta4 = { .545, 0, 0 },
  Maroon1 = { 1, .204, .204 },
  Maroon2 = { .932, .19, .19 },
  Maroon3 = { .804, .16, .16 },
  Maroon4 = { .545, .11, .11 },
  MediumOrchid1 = { .88, .4, .4 },
  MediumOrchid2 = { .82, .372, .372 },
  MediumOrchid3 = { .705, .32, .32 },
  MediumOrchid4 = { .48, .215, .215 },
  MediumPurple1 = { .67, .51, .51 },
  MediumPurple2 = { .624, .475, .475 },
  MediumPurple3 = { .536, .408, .408 },
  MediumPurple4 = { .365, .28, .28 },
  MistyRose1 = { 1, .894, .894 },
  MistyRose2 = { .932, .835, .835 },
  MistyRose3 = { .804, .716, .716 },
  MistyRose4 = { .545, .49, .49 },
  NavajoWhite1 = { 1, .87, .87 },
  NavajoWhite2 = { .932, .81, .81 },
  NavajoWhite3 = { .804, .7, .7 },
  NavajoWhite4 = { .545, .475, .475 },
  OliveDrab1 = { .752, 1, 1 },
  OliveDrab2 = { .7, .932, .932 },
  OliveDrab3 = { .604, .804, .804 },
  OliveDrab4 = { .41, .545, .545 },
  Orange1 = { 1, .648, .648 },
  Orange2 = { .932, .604, .604 },
  Orange3 = { .804, .52, .52 },
  Orange4 = { .545, .352, .352 },
  OrangeRed1 = { 1, .27, .27 },
  OrangeRed2 = { .932, .25, .25 },
  OrangeRed3 = { .804, .215, .215 },
  OrangeRed4 = { .545, .145, .145 },
  Orchid1 = { 1, .512, .512 },
  Orchid2 = { .932, .48, .48 },
  Orchid3 = { .804, .41, .41 },
  Orchid4 = { .545, .28, .28 },
  PaleGreen1 = { .604, 1, 1 },
  PaleGreen2 = { .565, .932, .932 },
  PaleGreen3 = { .488, .804, .804 },
  PaleGreen4 = { .33, .545, .545 },
  PaleTurquoise1 = { .732, 1, 1 },
  PaleTurquoise2 = { .684, .932, .932 },
  PaleTurquoise3 = { .59, .804, .804 },
  PaleTurquoise4 = { .4, .545, .545 },
  PaleVioletRed1 = { 1, .51, .51 },
  PaleVioletRed2 = { .932, .475, .475 },
  PaleVioletRed3 = { .804, .408, .408 },
  PaleVioletRed4 = { .545, .28, .28 },
  PeachPuff1 = { 1, .855, .855 },
  PeachPuff2 = { .932, .796, .796 },
  PeachPuff3 = { .804, .688, .688 },
  PeachPuff4 = { .545, .468, .468 },
  Pink1 = { 1, .71, .71 },
  Pink2 = { .932, .664, .664 },
  Pink3 = { .804, .57, .57 },
  Pink4 = { .545, .39, .39 },
  Plum1 = { 1, .732, .732 },
  Plum2 = { .932, .684, .684 },
  Plum3 = { .804, .59, .59 },
  Plum4 = { .545, .4, .4 },
  Purple1 = { .608, .19, .19 },
  Purple2 = { .57, .172, .172 },
  Purple3 = { .49, .15, .15 },
  Purple4 = { .332, .1, .1 },
  Red1 = { 1, 0, 0 },
  Red2 = { .932, 0, 0 },
  Red3 = { .804, 0, 0 },
  Red4 = { .545, 0, 0 },
  RosyBrown1 = { 1, .756, .756 },
  RosyBrown2 = { .932, .705, .705 },
  RosyBrown3 = { .804, .608, .608 },
  RosyBrown4 = { .545, .41, .41 },
  RoyalBlue1 = { .284, .464, .464 },
  RoyalBlue2 = { .264, .43, .43 },
  RoyalBlue3 = { .228, .372, .372 },
  RoyalBlue4 = { .152, .25, .25 },
  Salmon1 = { 1, .55, .55 },
  Salmon2 = { .932, .51, .51 },
  Salmon3 = { .804, .44, .44 },
  Salmon4 = { .545, .298, .298 },
  SeaGreen1 = { .33, 1, 1 },
  SeaGreen2 = { .305, .932, .932 },
  SeaGreen3 = { .264, .804, .804 },
  SeaGreen4 = { .18, .545, .545 },
  Seashell1 = { 1, .96, .96 },
  Seashell2 = { .932, .898, .898 },
  Seashell3 = { .804, .772, .772 },
  Seashell4 = { .545, .525, .525 },
  Sienna1 = { 1, .51, .51 },
  Sienna2 = { .932, .475, .475 },
  Sienna3 = { .804, .408, .408 },
  Sienna4 = { .545, .28, .28 },
  SkyBlue1 = { .53, .808, .808 },
  SkyBlue2 = { .494, .752, .752 },
  SkyBlue3 = { .424, .65, .65 },
  SkyBlue4 = { .29, .44, .44 },
  SlateBlue1 = { .512, .435, .435 },
  SlateBlue2 = { .48, .404, .404 },
  SlateBlue3 = { .41, .35, .35 },
  SlateBlue4 = { .28, .235, .235 },
  SlateGray1 = { .776, .888, .888 },
  SlateGray2 = { .725, .828, .828 },
  SlateGray3 = { .624, .712, .712 },
  SlateGray4 = { .424, .484, .484 },
  Snow1 = { 1, .98, .98 },
  Snow2 = { .932, .912, .912 },
  Snow3 = { .804, .79, .79 },
  Snow4 = { .545, .536, .536 },
  SpringGreen1 = { 0, 1, 1 },
  SpringGreen2 = { 0, .932, .932 },
  SpringGreen3 = { 0, .804, .804 },
  SpringGreen4 = { 0, .545, .545 },
  SteelBlue1 = { .39, .72, .72 },
  SteelBlue2 = { .36, .675, .675 },
  SteelBlue3 = { .31, .58, .58 },
  SteelBlue4 = { .21, .392, .392 },
  Tan1 = { 1, .648, .648 },
  Tan2 = { .932, .604, .604 },
  Tan3 = { .804, .52, .52 },
  Tan4 = { .545, .352, .352 },
  Thistle1 = { 1, .884, .884 },
  Thistle2 = { .932, .824, .824 },
  Thistle3 = { .804, .71, .71 },
  Thistle4 = { .545, .484, .484 },
  Tomato1 = { 1, .39, .39 },
  Tomato2 = { .932, .36, .36 },
  Tomato3 = { .804, .31, .31 },
  Tomato4 = { .545, .21, .21 },
  Turquoise1 = { 0, .96, .96 },
  Turquoise2 = { 0, .898, .898 },
  Turquoise3 = { 0, .772, .772 },
  Turquoise4 = { 0, .525, .525 },
  VioletRed1 = { 1, .244, .244 },
  VioletRed2 = { .932, .228, .228 },
  VioletRed3 = { .804, .196, .196 },
  VioletRed4 = { .545, .132, .132 },
  Wheat1 = { 1, .905, .905 },
  Wheat2 = { .932, .848, .848 },
  Wheat3 = { .804, .73, .73 },
  Wheat4 = { .545, .494, .494 },
  Yellow1 = { 1, 1, 1 },
  Yellow2 = { .932, .932, .932 },
  Yellow3 = { .804, .804, .804 },
  Yellow4 = { .545, .545, .545 },
  Gray0 = { .745, .745, .745 },
  Green0 = { 0, 1, 1 },
  Grey0 = { .745, .745, .745 },
  Maroon0 = { .69, .19, .19 },
  Purple0 = { .628, .125, .125 },

}

local color = Color "#ff0044"

-- Print color
print(color) -- prints: #ff0000

-- Print color as hsv
local h, s, v = color:hsv()
print(h * 360, s * 100, v * 100) -- prints: 0 100 100
print(color:tostring "hsv")      -- prints: hsv(0, 100%, 100%)

-- Print color as hwb
local h, w, b = color:hsv()
print(h * 360, w * 100, b * 100) -- prints: 0 0 0
print(color:tostring "hwb")      -- prints: hwb(0, 0%, 0%)

-- Print color as hsla
local h, s, l, a = color:hsla()
print(h * 360, s * 100, l * 100, a) -- prints: 0 100 50 1
print(color:tostring "hsla")        -- prints: hsla(0, 100%, 50%, 1)

-- Print color as rgba
local r, g, b, a = color:rgba()
print(r * 255, g * 255, b * 255, a) -- prints: 255 0 0 1
print(color:tostring "rgba")        -- prints: rgba(255, 0, 0, 1)

-- Print color as cmyk
print(color:cmyk())          --prints: 0 1 1 0
print(color:tostring "cmyk") -- prints: cmyk(0%, 100%, 100%, 0%)

-- Print color as NCol
print(color:tostring "ncol") -- prints: R0, 0%, 0%
