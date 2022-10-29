class Category < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true

    # similar to attr_reader, attr_accessor, this call to has_many will create methods for us at runtime
    has_many :tasks, dependent: :destroy

    # def tasks
    #    Task.where(category_id: id)
    # end

    belongs_to :user
end
