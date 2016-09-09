require 'action_view'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  CAT_COLORS = %w(black white orange brown)

  validates :sex, inclusion: %w(M F)
  validates :user_id, presence: true
  validates :color, inclusion: CAT_COLORS
  validates(
  :birth_date,
  :color,
  :name,
  :sex,
  presence: true
  )


  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy
  )

  belongs_to :user

  def age
    time_ago_in_words(birth_date)
  end
end
