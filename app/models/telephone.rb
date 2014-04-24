class Telephone < ActiveRecord::Base
  belongs_to :branch

  def to_s
    "Teléfono: (0#{self.ext}) #{self.num}"
  end
end
