class ChangeFeedsImageNullOk < ActiveRecord::Migration[5.2]
  def change
    change_column_null :feeds, :image, true
  end
end
