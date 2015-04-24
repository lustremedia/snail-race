#!/usr/bin/env ruby

class Snail

	@@snail_count = 0

	attr_reader :color, :lane, :field

    def initialize(color, lane)
        @color = color
        @field = 0
        @lane = lane
        @@snail_count += 1
        puts "Snail #{@color} ready to go!"
        pos
    end

   	def self.snail_count
    	@@snail_count
  	end

    def pos
    	puts "#{@color} snail running on lane #{@lane} and is on field #{@field}"
    end

    def move(finish)
    	if @field<finish
    		@field+=1
    	end
    end

    def fin(finish)
    	if @field==finish
    		"Finished: yes"
    	else
    	 	"Finished: no"
    	end
    end
end


class Board

	attr_reader :d1, :d2, :finish

	COLORS = ['blue','green','pink','orange','yellow','red']
	LANE = (1..6).to_a.shuffle

	def initialize
		setup_board
		puts LANE.to_s
	end

	def setup_board
		@finish = 10
		@d1=Dice.new
		@d2=Dice.new
		@sb=Snail.new('blue',LANE[0])
		@sg=Snail.new('green',LANE[1])
		@sp=Snail.new('pink',LANE[2])
		@sr=Snail.new('red',LANE[3])
		@so=Snail.new('orange',LANE[4])
		@sy=Snail.new('yellow',LANE[5])
	end

	def reset
		setup_board
	end

	def turn
		move=[@d1.throw_dice, @d2.throw_dice]

		move.each do |m|
			case m
			when 'orange'
			  	@so.move(@finish)
			when 'blue'
				@sb.move(@finish)
			when 'red'
				@sr.move(@finish)
			when 'green'
				@sg.move(@finish)
			when 'pink'
				@sp.move(@finish)
			when 'yellow'
				@sy.move(@finish)
			end
		end

		puts "Dice were roled and show:"
		puts move[0].to_s
		puts move[1].to_s
		#move snails
		show_board
	end

	def show_board

		# print board
		@sb.pos
		@sb.fin(@finish)

		@sg.pos
		@sg.fin(@finish)

		@sp.pos
		@sp.fin(@finish)

		@sr.pos
		@sr.fin(@finish)

		@so.pos
		@so.fin(@finish)

		@sy.pos
		@sy.fin(@finish)

	end
end

class Dice
	attr_reader :top
	COLORS = ['blue','green','pink','orange','yellow','red']

	def initialize
		@top=COLORS.sample
	end

	def throw_dice
		@top=COLORS.sample
	end
end