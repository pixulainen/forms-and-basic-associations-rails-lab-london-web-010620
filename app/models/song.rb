class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content:note)
    end
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def artist_name
    self.artist ? self.artist.name : nil
  end
end
