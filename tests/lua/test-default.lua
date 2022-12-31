require('busted.runner')()

local farbe = require('farbe')

local Color = farbe.Color

describe('Class “Color”', function()
  it('Konstructor', function()
    local color = Color('#ffffff')
    assert.is.equal(color.r, 1.0)
    assert.is.equal(color.g, 1.0)
    assert.is.equal(color.b, 1.0)
    assert.is.equal(color.a, 1.0)
  end)

end)
