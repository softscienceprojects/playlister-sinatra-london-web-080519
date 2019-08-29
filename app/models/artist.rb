class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs


def slug
    slugified = self.name.downcase.join("-")
end

def self.find_by_slug(slug)

end

end