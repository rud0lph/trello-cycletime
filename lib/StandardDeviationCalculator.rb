module AgileTrello
	class StandardDeviationCalculator
		def initialize(average_cycle_time_calculator)
			@average_cycle_time_calculator = average_cycle_time_calculator
			@cycle_times = []
		end

		def add(cycle_time)
			@average_cycle_time_calculator.add(cycle_time)
			@cycle_times.push(cycle_time)
		end

		def standard_deviation
			mean = @average_cycle_time_calculator.average
			return 0 if mean == 0
			squared_deviations = @cycle_times.map do |cycle_time|
				(cycle_time - mean) ** 2
			end
			variance = squared_deviations.reduce(:+) / squared_deviations.length
			standard_deviation = Math.sqrt(variance).round(2)
		end
	end
end