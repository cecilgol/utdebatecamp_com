class NewsPost < ApplicationRecord
  belongs_to :account

  alias_attribute :author, :account

  validates :title, presence: true
  validates :body, presence: true
end
