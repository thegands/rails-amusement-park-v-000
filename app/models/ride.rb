class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    a = ["Sorry."]
    if self.user.tickets < self.attraction.tickets
      a << "You do not have enough tickets the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      a << "You are not tall enough to ride the #{self.attraction.name}."
    end
    if a.count > 1
      a.join(" ")
    else
      self.user.update(
        tickets: self.user.tickets - self.attraction.tickets,
        nausea: self.user.nausea + self.attraction.nausea_rating,
        happiness: self.user.happiness + self.attraction.happiness_rating
      )
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
