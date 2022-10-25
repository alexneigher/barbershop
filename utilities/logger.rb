class Logger
  def self.log(seconds, msg)
    puts "[#{TimeConverter.time(seconds)}] #{msg}"
  end
end