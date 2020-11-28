class Song
  attr_accessor :name, :artist, :genre

  @@count = 0
  @@genres = []
  @@artists = []
  @@g_count_hash = {}
  @@a_count_hash = {}


  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists << artist
  end

  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq!
    @@genres
  end

  def self.artists
    @@artists.uniq!
    @@artists
  end

  def self.genre_count
    @@genres.group_by(&:itself).each {|key,value| @@genre_count[key] = value.count}
    @@g_count_hash
  end

  def self.artist_count
    @@artists.each do |song_artist|
      if @@a_count_hash[song_artist]
        @@a_count_hash.each {|artist_key, value| value+=1}
      else
        @@a_count_hash[song_artist]
        @@a_count_hash[song_artist] = 1
      end
    end
    @@a_count_hash
  end

end
