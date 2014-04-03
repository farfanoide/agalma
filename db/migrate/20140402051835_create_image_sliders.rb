class CreateImageSliders < ActiveRecord::Migration
  def change
    create_table :image_sliders do |t|
      t.string :image

      t.timestamps
    end
  end
end
