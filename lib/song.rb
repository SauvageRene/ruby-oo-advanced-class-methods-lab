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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
    self.find_by_name(name) || self.create_by_name(name)
  end #Returning the song object using "OR"

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ") #in this logic we delete the .mp3 at the end of the song and we split (" - ") to have an array of ["Taylor Swift", "Blank Space"]
    song = self.new
    song.name = split_filename[1] #assigned name to 'Blank Space'
    song.artist_name = split_filename[0] #assinging artist to "Taylor Swift"
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end 