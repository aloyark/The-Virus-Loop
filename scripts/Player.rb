class Player
    def initialize(x, y)
        @realX = x
        @realY = y

        @standLeft = Image.load_tiles($window, "graphics/sprites/standLeft.png", 32, 32, false)
        @standRight = Image.load_tiles($window, "graphics/sprites/standRight.png", 32, 32, false)
        @standUp = Image.load_tiles($window, "graphics/sprites/standUp.png", 32, 32, false)
        @standDown = Image.load_tiles($window, "graphics/sprites/standDown.png", 32, 32, false)

        @walkingLeft = Image.load_tiles($window, "graphics/sprites/walkingLeft.png", 32, 32, false)
        @walkingRight = Image.load_tiles($window, "graphics/sprites/walkingRight.png", 32, 32, false)
        @walkingUp = Image.load_tiles($window, "graphics/sprites/walkingUp.png", 32, 32, false)
        @walkingDown = Image.load_tiles($window, "graphics/sprites/walkingDown.png", 32, 32, false)

        @sprite = @standRight
        @dir = :right
        @x = @realX + (@sprite[0].width / 2)
        @y = @realY + @sprite[0].height

        @speed = 0.5
        @moveX = 0
        @moveY = 0
        @moving = false
    end

    def update
        @realX = @x - (@sprite[0].width / 2)
        @realY = @y - @sprite[0].height

        if @moving then
			if @moveX > 0 then
				@moveX -= 1
				@x += @speed
			elsif @moveX < 0 then
				@moveX += 1
				@x -= @speed
			elsif @moveX == 0 then
				@moving = false
			end

            if @moveY > 0 then
				@moveY -= 1
				@y -= @speed
			elsif @moveY < 0 then
				@moveY += 1
				@y += @speed
			elsif @moveY == 0 then
				@moving = false
			end
		else
            case @dir
    			when :left
    				@sprite = @standLeft
    			when :right
    				@sprite = @standRight
    			when :up
    				@sprite = @standUp
    			when :down
    				@sprite = @standDown
			end
		end
    end

    #Movement funtions
    def moveLeft
        @dir = :left
        @moveX = -3
        @sprite = @walkingLeft
        @moving = true
    end

    def moveRight
        @dir = :right
        @moveX = 3
        @sprite = @walkingRight
        @moving = true
    end

    def moveUp
        @dir = :up
        @moveY = 3
        @sprite = @walkingUp
        @moving = true
    end

    def moveDown
        @dir = :down
        @moveY = -3
        @sprite = @walkingDown
        @moving = true
    end

    def movingFalse
        @moving = false
        @sprite = @standDown
    end
    #/Movement funtions

    #Getters
    def get_x
        return @x
    end

    def get_y
        return @y
    end
    #/Getters

    def draw(z=5)
        frame = milliseconds / 100 % @sprite.size
        @sprite[frame].draw(@realX, @realY, z, 1.5, 1.5)
    end
end
