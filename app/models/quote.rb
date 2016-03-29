class Quote < ActiveRecord::Base
  validates :quote, presence: true
end
