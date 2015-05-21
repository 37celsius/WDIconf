class Talk < ActiveRecord::Base
  belongs_to :speaker

  def initialize
    convert_time
  end

  def convert_time
    self.update(start_time: "#{self.date.hour}:#{self.date.min}")
  end

end
