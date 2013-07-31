class CreateLongUrls < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :url, :length => 1023
      t.timestamps
    end
  end
end
