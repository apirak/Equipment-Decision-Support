# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flag_image(code)
    "#{code.to_s.split("-").last.downcase}.png"
  end

  I18n::Backend::Simple.class_eval do
    #    def get_translations
    #      return translations
    #    end
  end
end
