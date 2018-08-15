class Utils

  def add_token_to_header(token)
    headers = {
      :content_type => 'application/json',
      :authorization => 'Bearer ' + token
    }
    return headers
  end


  def add_double_quotes(string)
    return "\"#{string}\""
  end


  def return_token(response)
    return response.body[10...-2]
  end

end
