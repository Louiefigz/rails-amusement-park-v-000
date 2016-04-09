class Ride < ActiveRecord::Base
  # write associations here

  belongs_to :attraction
  belongs_to :user


  def take_ride

    if !cost && !height

      new_ticket_number
      "Thanks for riding the #{self.attraction.name}!"
    elsif cost && height
        "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif cost
        "Sorry. You do not have enough tickets the #{self.attraction.name}."
      elsif height
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end

  end

  def cost

    self.attraction.tickets - self.user.tickets > 0
  end

  def height
  
     self.attraction.min_height - self.user.height > 0
  end

  def new_ticket_number
    self.user.update(tickets: self.user.tickets - self.attraction.tickets)
    new_happiness = self.attraction.happiness_rating + self.user.happiness
    new_nausea = self.attraction.nausea_rating + self.user.nausea
    self.user.update(happiness: new_happiness, nausea: new_nausea)
  end



end
