require 'date'
require 'action_view'

class Cat < ActiveRecord::Base

  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(black brown blue orange white), message: '%{value} is not a valid color' }
  validates :sex, inclusion: { in: %w(M F), message: '%{value} is not a valid gender' }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

end
