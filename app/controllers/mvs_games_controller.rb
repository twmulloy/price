class MvsGamesController < ApplicationController
  # GET /mvs_games
  # GET /mvs_games.json
  def index
    @mvs_games = MvsGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mvs_games }
    end
  end

  # GET /mvs_games/1
  # GET /mvs_games/1.json
  def show
    @mvs_game = MvsGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mvs_game }
    end
  end

  # GET /mvs_games/new
  # GET /mvs_games/new.json
  def new
    @mvs_game = MvsGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mvs_game }
    end
  end

  # GET /mvs_games/1/edit
  def edit
    @mvs_game = MvsGame.find(params[:id])
  end

  # POST /mvs_games
  # POST /mvs_games.json
  def create
    @mvs_game = MvsGame.new(params[:mvs_game])

    respond_to do |format|
      if @mvs_game.save
        format.html { redirect_to @mvs_game, notice: 'Mvs game was successfully created.' }
        format.json { render json: @mvs_game, status: :created, location: @mvs_game }
      else
        format.html { render action: "new" }
        format.json { render json: @mvs_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mvs_games/1
  # PUT /mvs_games/1.json
  def update
    @mvs_game = MvsGame.find(params[:id])

    respond_to do |format|
      if @mvs_game.update_attributes(params[:mvs_game])
        format.html { redirect_to @mvs_game, notice: 'Mvs game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mvs_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mvs_games/1
  # DELETE /mvs_games/1.json
  def destroy
    @mvs_game = MvsGame.find(params[:id])
    @mvs_game.destroy

    respond_to do |format|
      format.html { redirect_to mvs_games_url }
      format.json { head :no_content }
    end
  end
end
