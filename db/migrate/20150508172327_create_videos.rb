class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :title
      t.text :description
      t.text :small_cover_url
      t.text :large_cover_url

      t.timestamps
    end
  end
end
