class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    query = self.albums
    query = query.select("albums.title, COUNT(*) AS tracks_count")
    query = query.joins(:tracks)
    query = query.group("albums.title")
    result = {}
    query.each do |album|
      result[album.title] = album.tracks_count
    end
    result
  end
end
