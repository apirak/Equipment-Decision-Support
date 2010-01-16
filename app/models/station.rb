class Station < Position
  def self.column_models
    Position.column_models
  end

  def self.field_models
    Position.field_models
  end
end