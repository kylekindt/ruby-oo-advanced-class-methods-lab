class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song 
    song 
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.detect{|s| s.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(f_name)
    f_array = f_name.split(" - ")
    artist_name = f_array[0]
    s_name = f_array[1].gsub(".mp3", "")
    song = self.create
    song.name = s_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(f_name)
    f_array = f_name.split(" - ")
    artist_name = f_array[0]
    s_name = f_array[1].gsub(".mp3", "")
    song = self.create
    song.name = s_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
