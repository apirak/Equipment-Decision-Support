String.class_eval do
  def to_squawk
    "squawk! #{self}".strip
  end
end

Array.class_eval do
  def to_ext_json(options = {})
    root = options[:root] || 'root'

    unless (success = options.delete(:success)).nil?
      success = ", \"success\": #{success}"
    end

    if (errors = options.delete(:errors))
      errors = ", \"errors\": \"#{errors}\""
    end

    if (total_count = options.delete(:total_count))
      total_count = ", \"totalCount\": \"#{total_count}\""
    end

    if empty?
      prepare_models = []
    else
      ActiveRecord::Base.include_root_in_json = false
      methods = first.class.column_models.map {|m| m[:name] if m[:method]}.compact
      only = first.class.column_models.map {|m| m[:name]}.compact
      prepare_models = collect do |c|
        c.to_json(:methods => methods, :only => only)
      end
    end

    return "{\"#{root}\":[#{prepare_models.join(",")}] #{success} #{errors} #{total_count}}"
  end
end