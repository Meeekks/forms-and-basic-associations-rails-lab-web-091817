class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end


  def genre_name
    if self.genre
      self.genre.name
    end
  end


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end


  def artist_name
    if self.artist
      self.artist.name
    end
  end


  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        self.notes.build(content: content)
      end
    end
  end


  def note_contents
    all_note_content = []
    self.notes.each do |note|
      all_note_content << note.content
    end
    all_note_content
  end

end
