class TimeConverter
  # takes the number of ticks of the simulation (seconds)
  # and convert them into Hours:Minutes:Seconds to represent "simulation time"
  def self.time(seconds)
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end
end