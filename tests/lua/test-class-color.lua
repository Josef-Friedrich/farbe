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

  it('Constructor', function()
    local black = Color('#000')
    local white = Color('#fff')
    local red = Color('#f00')
    local green = Color('#0f0')
    local blue = Color('#00f')
    local yellow = Color('#ff0')
    local cyan = Color('#0ff')
    local magenta = Color('#f0f')

    assert.is.equal(Color('cmyk(100%, 100%, 100%, 100%)'), black)
    assert.is.equal(Color('cmyk(1, 1, 1, 1)'), black)
    assert.is.equal(Color('cmyk(1.0, 1.0, 1.0, 1.0)'), black)
    assert.is.equal(Color('cmyk(0, 0, 0, 0)'), white)
    assert.is.equal(Color('cmyk(0, 1, 1, 0)'), red)
    assert.is.equal(Color('cmyk(0, 1, 0, 0)'), magenta)

    assert.is.equal(Color('rgb(0,0,0)'), black)
    assert.is.equal(Color('rgb(0.0,0.0,0.0)'), black)
    assert.is.equal(Color('rgb(255, 255, 255)'), white)
    assert.is.equal(Color('black'), black)
    assert.is.equal(Color('white'), white)

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
