class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

 # validates :name, presence: true
 #  validates :happiness, presence: true
 #  validates :nausea, presence: true
 #   validates :height, presence: true
  def mood
   happiness - nausea > 0 ? "happy" : "sad" if happiness && nausea

  end
end
