class Api::StatesController < ApplicationController
  def index
    @states = State.all
    # render json: "All the states' horses and all the states' men ..."
    # @alignments = Alignment.all
    render "index.json.jb"
  end

  def show

    # @state = State.find_by(abbrev: params[:abbrev])
    # p "HERE ARE THE PARAMS"
    # p params
    # p "HERE'S THE STATE CODE INFO VIA HARDCODING"
    # @state_code = Abbreviation.find_by(code: "FL")
    # p @state_code
    # p "HERE'S THE STATE CODE INFO VIA PARAMS"
    @state_code = Abbreviation.find_by(code: params[:code])
    # p @state_code
    # p "Here's our state name : "
    state = @state_code.state
    # p state
    # p "HERE'S THE STATE INFO VIA PARAMS"
    @state = State.find_by(state: state)
    # p @state
    render "show.json.jb"
  end
end
