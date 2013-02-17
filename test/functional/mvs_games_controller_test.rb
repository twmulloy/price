require 'test_helper'

class MvsGamesControllerTest < ActionController::TestCase
  setup do
    @mvs_game = mvs_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mvs_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mvs_game" do
    assert_difference('MvsGame.count') do
      post :create, mvs_game: { developer: @mvs_game.developer, meg: @mvs_game.meg, ngh: @mvs_game.ngh, series: @mvs_game.series, title_english: @mvs_game.title_english, title_katakana: @mvs_game.title_katakana, title_romaji: @mvs_game.title_romaji, year: @mvs_game.year }
    end

    assert_redirected_to mvs_game_path(assigns(:mvs_game))
  end

  test "should show mvs_game" do
    get :show, id: @mvs_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mvs_game
    assert_response :success
  end

  test "should update mvs_game" do
    put :update, id: @mvs_game, mvs_game: { developer: @mvs_game.developer, meg: @mvs_game.meg, ngh: @mvs_game.ngh, series: @mvs_game.series, title_english: @mvs_game.title_english, title_katakana: @mvs_game.title_katakana, title_romaji: @mvs_game.title_romaji, year: @mvs_game.year }
    assert_redirected_to mvs_game_path(assigns(:mvs_game))
  end

  test "should destroy mvs_game" do
    assert_difference('MvsGame.count', -1) do
      delete :destroy, id: @mvs_game
    end

    assert_redirected_to mvs_games_path
  end
end
