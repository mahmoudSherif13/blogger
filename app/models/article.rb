class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings 

    def tag_list
        tags.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").map{|s| s.strip.downcase()}.uniq()
        tags = tag_names.map{ |name| Tag.find_or_create_by(name: name) }
        self.tags = tags
    end
end
