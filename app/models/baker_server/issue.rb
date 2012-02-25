module BakerServer
  class Issue < ActiveRecord::Base
    validates_presence_of :issue_id
    validates_presence_of :published_date
    validates_presence_of :summary
    validates_length_of :summary, :maximum => 2000
    validate :published_date_order

    image_accessor :cover_art

    protected
    def published_date_order
      if self.end_date && (self.published_date > self.end_date)
        self.errors.add(:published_date, "Published date should be less than end date")
      end
    end

  end
end

#More Validations
#cover art should be a png file
#It should have 512px

#Instead of having one cover art user can submit multiple cover arts for various devises