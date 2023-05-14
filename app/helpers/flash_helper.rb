module FlashHelper
  def css_class_for_flash(flash_key)
    case flash_key.to_sym
    when :success
      "bg-green-700 text-white"
    when :warning
      "bg-yellow-500 text-white"
    when :error
      "bg-red-500 text-white"
    else
      "bg-primary-500 text-white"
    end
  end

  def css_class_for_devise(flash_key)
    case flash_key.to_sym
    when :notice
      "text-primary-500"
    else
      "text-red-500"
    end
  end
end