class AddCatchphraseToPrototypes < ActiveRecord::Migration[6.0]
  def change
    rename_column :prototypes, :Catchphrase, :catchphrase  # 大文字小文字に注意
  end
end