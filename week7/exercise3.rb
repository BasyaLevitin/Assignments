# ## Exercise 3: Player

# 1. Create a class called `Player`.
# 2. Every player should have four attributes: `gold_coins`, `health_points`, and `lives`.
# 3. `lives` should start at `5`.
# 4. `gold_coins` should start at `0`.
# 5. `health_points` should start at `10`.
# 6. Your class should have an instance method called `level_up` that increases `lives` by one.
# 7. Your class should have an instance method called `collect_treasure` that increases `gold_coins` by one.  If `gold_coins` is a multiple of ten (eg, 10, 20, 30, and so on) then the `collect_treasure` method should run the `level_up` method.
# 8. Your class should have an instance method called `do_battle` that accepts one `damage` argument and subtracts it from the player's `health_points`.  If `health_points` falls below one, subtract one from `lives` and reset `health_points` to ten.  If you have run out of lives, this method should run another method called `restart` (see below).
# 9. The `restart` instance method should set all attributes back to their starting values (`5`, `0`, and `10`).

# Don't forget to test out your code every step of the way by creating instances of your class and trying to run your different methods.  You should be committing every time you get a new method working.

class Player

    def initialize 
        @gold_coins = 5 
        @health_points = 0
        @lives = 10
    end

    def level_up
        @lives = @lives + 1
    end

    def collect_treasure
        @gold_coins = @gold_coins + 1
        if @gold_coins % 10 == 0
            level_up
        end
    end
# 8. Your class should have an instance method called `do_battle` that accepts one `damage` argument and subtracts it from the player's `health_points`.  If `health_points` falls below one, subtract one from `lives` and reset `health_points` to ten.  If you have run out of lives, this method should run another method called `restart` (see below).
    def do_battle(damage)
        @health_points = @health_points - damage

        if @health_points < 1
            if @lives > 0
                @lives = @lives - 1 
                @health_points = 10
            else
                restart()
            end
        end
    end

    def restart
        @gold_coins = 5 
        @health_points = 0
        @lives = 10
    end

end

jim = Player.new

# 10.times do
#     jim.do_battle(10)
# end
jim.do_battle(20)

p jim