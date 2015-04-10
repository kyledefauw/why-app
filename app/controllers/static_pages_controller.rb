class StaticPagesController < PublicController

  def all_obstacles
    @life_venture = LifeVenture.all
    @steps = Step.all
    @obstacles = Obstacle.all
  end

end
