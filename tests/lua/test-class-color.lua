require('busted.runner')()

local farbe = require('farbe')

local Color = farbe.Color

describe('Class “Color”', function()
  it('Constructor', function()
    local color = Color('#ffffff')
    assert.is.equal(color.r, 1.0)
    assert.is.equal(color.g, 1.0)
    assert.is.equal(color.b, 1.0)
    assert.is.equal(color.a, 1.0)
  end)

  it('Method cmyk()', function()
    local color = Color('#000000')
    local c, m, y, k = color:cmyk()
    assert.is.equal(c, 0.0)
    assert.is.equal(m, 0.0)
    assert.is.equal(y, 0.0)
    assert.is.equal(k, 1.0)
  end)

end)
