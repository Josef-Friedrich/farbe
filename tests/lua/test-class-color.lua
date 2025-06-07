require('busted.runner')()

local farbe = require('farbe')

local Color = farbe.Color

describe('Class “Color”', function()
  describe('Constructor', function()
    local black = Color('#000')
    local white = Color('#fff')
    local red = Color('#f00')
    local green = Color('#0f0')
    local blue = Color('#00f')
    local yellow = Color('#ff0')
    local cyan = Color('#0ff')
    local magenta = Color('#f0f')

    it('hex', function()
      local color = Color('#ffffff')
      assert.is.equal(color.r, 1.0)
      assert.is.equal(color.g, 1.0)
      assert.is.equal(color.b, 1.0)
      assert.is.equal(color.a, 1.0)
    end)


    describe('css style functions as string', function()
      it('rgb(r, g, b)', function()
        assert.is.equal(Color('rgb(0,0,0)'), black)
        assert.is.equal(Color('rgb(0.0,0.0,0.0)'), black)
        assert.is.equal(Color('rgb(255, 255, 255)'), white)
      end)

      it('rgba(r, g, b, a)', function()
        assert.is.equal(Color('rgba(0,0,0,0)'), Color('#0000'))
      end)

      it('hsl(h, s, l)', function() end)

      it('hsla(h, s, l, a)', function() end)

      it('hsv(h, s, v)', function() end)

      it('hsva(h, s, v, a)', function() end)

      it('hwb(h, w, b)', function() end)

      it('hwba(h, w, b, a)', function() end)

      it('cmyk(c, m, y, k)', function()
        assert.is.equal(Color('cmyk(100%, 100%, 100%, 100%)'), black)
        assert.is.equal(Color('cmyk(1, 1, 1, 1)'), black)
        assert.is.equal(Color('cmyk(1.0, 1.0, 1.0, 1.0)'), black)
        assert.is.equal(Color('cmyk(0, 0, 0, 0)'), white)
        assert.is.equal(Color('cmyk(0, 1, 1, 0)'), red)
        assert.is.equal(Color('cmyk(0, 1, 0, 0)'), magenta)
      end)
    end)

    describe('hex string', function()
      it('#rgb', function()
        assert.is.equal(Color('#aaa'), Color('rgb(170, 170, 170)'))
      end)

      it('#RGB', function()
        assert.is.equal(Color('#BBB'), Color('rgb(187, 187, 187)'))
      end)

      it('rgb', function()
        assert.is.equal(Color('ccc'), Color('rgb(204, 204, 204)'))
      end)

      it('#rgba', function()
        assert.is.equal(Color('#aaac'), Color('rgba(170, 170, 170, 0.8)'))
      end)

      it('#RGBA', function()
        assert.is.equal(Color('#BBBF'), Color('rgba(187, 187, 187, 1)'))
      end)

      it('rgba', function()
        assert.is.equal(Color('cccc'), Color('rgba(204, 204, 204, 0.8)'))
      end)

      it('#rrggbb', function()
        assert.is.equal(Color('#aaaaaa'), Color('rgb(170, 170, 170)'))
      end)

      it('#RRGGBB', function()
        assert.is.equal(Color('#BBBBBB'), Color('rgb(187, 187, 187)'))
      end)

      it('rrggbb', function()
        assert.is.equal(Color('cccccc'), Color('rgb(204, 204, 204)'))
      end)

      it('#rrggbbaa', function()
        assert.is.equal(Color('#aaaaaacc'), Color('rgba(170, 170, 170, 0.8)'))
      end)

      it('#RRGGBBAA', function()
        assert.is.equal(Color('#BBBBBBFF'), Color('rgba(187, 187, 187, 1)'))
      end)

      it('rrggbbaa', function()
        assert.is.equal(Color('cccccccc'), Color('rgba(204, 204, 204, 0.8)'))
      end)
    end)

    it('Color names', function()
      assert.is.equal(Color('black'), black)
      assert.is.equal(Color('white'), white)
    end)
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
