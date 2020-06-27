class Post < ApplicationRecord
    default_scope{order created_at: :desc}
    #Ex:- :default =>''
    mount_uploader :image, ImageUploader
    belongs_to :account
    has_many :likes
    has_many :comments
    before_create :set_active
    scope :active, -> {where active: true}
    
    private
    def set_active
        self.active = true
    end
    
    def set_page
        self.per_page = 10
    end
end
