require('busted.runner')()

local farbe = require('farbe')

local convert = farbe.convert
local rgb_to_cmyk = convert.rgb_to_cmyk
local cmyk_to_rgb = convert.cmyk_to_rgb

describe('Convert functions', function()
  describe('rgb_to_cmyk', function()
    local function assert_rgb_is_cmyk(r,
      g,
      b,
      c_expected,
      m_expected,
      y_expected,
      k_expected)
      local c, m, y, k = rgb_to_cmyk(r, g, b)
      assert.is.equal(c, c_expected, 'cyan')
      assert.is.equal(m, m_expected, 'magenta')
      assert.is.equal(y, y_expected, 'yellow')
      assert.is.equal(k, k_expected, 'key(black)')
    end

    -- https://www.rapidtables.com/convert/color/rgb-to-cmyk.html

    it('black', function()
      assert_rgb_is_cmyk(0, 0, 0, --[[cymk]] 0, 0, 0, 1)
    end)

    it('white', function()
      assert_rgb_is_cmyk(1, 1, 1, --[[cymk]] 0, 0, 0, 0)
    end)

    it('red', function()
      assert_rgb_is_cmyk(1, 0, 0, --[[cymk]] 0, 1, 1, 0)
    end)

    it('green', function()
      assert_rgb_is_cmyk(0, 1, 0, --[[cymk]] 1, 0, 1, 0)
    end)

    it('blue', function()
      assert_rgb_is_cmyk(0, 0, 1, --[[cymk]] 1, 1, 0, 0)
    end)

    it('yellow', function()
      assert_rgb_is_cmyk(1, 1, 0, --[[cymk]] 0, 0, 1, 0)
    end)

    it('cyan', function()
      assert_rgb_is_cmyk(0, 1, 1, --[[cymk]] 1, 0, 0, 0)
    end)

    it('magenta', function()
      assert_rgb_is_cmyk(1, 0, 1, --[[cymk]] 0, 1, 0, 0)
    end)
  end)

  describe('cmyk_to_rgb', function()
    local function assert_cymk_is_rgb(c, m, y, k,
      r_expected,
      g_expected,
      b_expected)
      local r, g, b = cmyk_to_rgb(c, m, y, k)
      assert.is.equal(r, r_expected, 'red')
      assert.is.equal(g, g_expected, 'green')
      assert.is.equal(b, b_expected, 'blue')
    end

    -- https://www.rapidtables.com/convert/color/cmyk-to-rgb.html
    it('black', function()
      assert_cymk_is_rgb(0, 0, 0, 1, --[[rgb]] 0, 0, 0)
    end)

    it('white', function()
      assert_cymk_is_rgb(0, 0, 0, 0, --[[rgb]] 1, 1, 1)
    end)

    it('red', function()
      assert_cymk_is_rgb(0, 1, 1, 0, --[[rgb]] 1, 0, 0)
    end)

    it('green', function()
      assert_cymk_is_rgb(1, 0, 1, 0, --[[rgb]] 0, 1, 0)
    end)

    it('blue', function()
      assert_cymk_is_rgb(1, 1, 0, 0, --[[rgb]] 0, 0, 1)
    end)

    it('yellow', function()
      assert_cymk_is_rgb(0, 0, 1, 0, --[[rgb]] 1, 1, 0)
    end)

    it('cyan', function()
      assert_cymk_is_rgb(1, 0, 0, 0, --[[rgb]] 0, 1, 1)
    end)

    it('magenta', function()
      assert_cymk_is_rgb(0, 1, 0, 0, --[[rgb]] 1, 0, 1)
    end)

    it('Gimp 8f8f60', function()
      assert_cymk_is_rgb(0.25, 0.25, 0.5, 0.25, --[[rgb]] 0.5625, 0.5625, 0.375)
    end)
  end)

end)
