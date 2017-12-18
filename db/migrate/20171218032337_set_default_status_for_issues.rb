class SetDefaultStatusForIssues < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :status, :string, default: 'reported'
  end
end
