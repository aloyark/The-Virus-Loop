class SceneMap
    def initialize
        @player = Player.new(320, 240)

    end

    def update
        @player.update

        if $window.button_down? char_to_button_id("w") then @player.moveUp end
        if $window.button_down? char_to_button_id("s") then @player.moveDown end
        if $window.button_down? char_to_button_id("d") then @player.moveRight end
        if $window.button_down? char_to_button_id("a") then @player.moveLeft end

        if $window.button_down? char_to_button_id("a") and $window.button_down? char_to_button_id("d") then @player.movingFalse end
        if $window.button_down? char_to_button_id("s") and $window.button_down? char_to_button_id("w") then @player.movingFalse end

    end

    def draw
        @player.draw
    end

    def button_down(id)
        if id == KbNumpad0 then exit end
    end

    def button_up(id)

    end
end
