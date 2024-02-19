require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    @letters = ("a"..."z").to_a.sample(10)
  end

  def score
    # Vérifier que le mot l'utilisateur rentre contiennent que les lettres de @letters
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    api_serialized = URI.open(url).read
    api = JSON.parse(api_serialized)
    # Vérifier que le mot est en anglais, présent dans l'API
    if contains(params["word"], params["letters"]) == false
      @result = "This word isn't in english go learn"
    elsif api["found"] == false
      @result = " This world can be done with this letter"
    else
      @result = "Perfect"
    end
  end

  private

  def contains(word, list)
    word = word.chars
    word.each do |letter|
      if list.include?(letter) == false
        return false
      end
    end
      # letters.each do |letter|
      # vérifier que pour chaque lettre du mots ca appartient à la liste de lettre
    #   end
    # end
  end
end
