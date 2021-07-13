class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    enum group_class: [:men, :women, :mixed]

    def totalAttendance
        self.concerts.map { |concert| concert.attendance }.sum
    end

    def currentMonthConcert
        count = 0
        self.concerts.map do |concert|
            if concert.date.month == Time.now.month
                count += 1
            end
        end
        count
    end

    def lastConcert
        lastConcert = self.concerts.map {|concert| concert.date}.max
        if lastConcert
            lastConcertInWords = lastConcert.strftime("%Y-%B-%A")
            "#{lastConcertInWords}"
        end
    end
            
    def maximumAttendance
        self.concerts.map {|concert| concert.attendance}.max
    end

    def longestConcert
        self.concerts.map {|concert| concert.duration}.max
    end

end
