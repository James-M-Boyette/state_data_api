class Api::StatesController < ApplicationController
  def index

    # render json: "All the states' horses and all the states' men ..."
    # @alignments = Alignment.all
    render "index.json.jb"
  end

  def show

    # @state = State.find_by(abbrev: params[:abbrev])
    p "HERE ARE THE PARAMS"
    p params
    # @state = Abbreviation.find_by(state: params[:code])
    p "HERE'S THE STATE INFO VIA HARDCODING"
    @state = Abbreviation.find_by(code: "FL")
    p @state
    p "HERE'S THE STATE INFO VIA PARAMS"
    @state = Abbreviation.find_by(code: params[:code])
    p @state
    render "show.json.jb"
  end
end
