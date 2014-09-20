class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
