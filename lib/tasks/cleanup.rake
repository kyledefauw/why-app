namespace :cleanup do
  desc 'Fix invalid data'
  task data: :environment do
    Reason.where.not(life_venture_id: LifeVenture.pluck(:id)).destroy_all
    Step.where.not(life_venture_id: LifeVenture.pluck(:id)).destroy_all
    Reason.where(life_venture_id: nil).destroy_all
    Step.where(life_venture_id: nil).destroy_all
  end
end
