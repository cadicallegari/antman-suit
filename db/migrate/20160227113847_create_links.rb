class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links, id: :uuid do |t|
      t.string   :url,        null: false
      t.string   :shortcode, null: false, index: true
      t.datetime :last_seen
      t.integer  :redirect_count, default: 0

      t.timestamps null: false
    end
  end

end
