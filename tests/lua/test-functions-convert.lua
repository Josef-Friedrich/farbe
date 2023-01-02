require('busted.runner')()

local farbe = require('farbe')

local convert = farbe.convert
local rgb_to_cmyk = convert.rgb_to_cmyk

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

    it('black', function()
      assert_rgb_is_cmyk(0, 0, 0, 0, 0, 0, 1)
    end)

    it('white', function()
      assert_rgb_is_cmyk(1, 1, 1, 0, 0, 0, 0)
    end)

    it('red', function()
      assert_rgb_is_cmyk(1, 0, 0, 0, 1, 1, 0)
    end)

    it('green', function()
      assert_rgb_is_cmyk(0, 1, 0, 1, 0, 1, 0)
    end)

    it('blue', function()
      assert_rgb_is_cmyk(0, 0, 1, 1, 1, 0, 0)
    end)

    it('yellow', function()
      assert_rgb_is_cmyk(1, 1, 0, 0, 0, 1, 0)
    end)

    it('cyan', function()
      assert_rgb_is_cmyk(0, 1, 1, 1, 0, 0, 0)
    end)

    it('magenta', function()
      assert_rgb_is_cmyk(1, 0, 1, 0, 1, 0, 0)
    end)
  end)

end)
