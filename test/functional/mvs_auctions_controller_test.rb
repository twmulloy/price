require 'test_helper'

class MvsAuctionsControllerTest < ActionController::TestCase
  setup do
    @mvs_auction = mvs_auctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mvs_auctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mvs_auction" do
    assert_difference('MvsAuction.count') do
      post :create, mvs_auction: { approved: @mvs_auction.approved, auction_end: @mvs_auction.auction_end, ended_at: @mvs_auction.ended_at, item_id: @mvs_auction.item_id, large: @mvs_auction.large, medium: @mvs_auction.medium, mvs_game_id: @mvs_auction.mvs_game_id, price: @mvs_auction.price, small: @mvs_auction.small, title: @mvs_auction.title, url: @mvs_auction.url }
    end

    assert_redirected_to mvs_auction_path(assigns(:mvs_auction))
  end

  test "should show mvs_auction" do
    get :show, id: @mvs_auction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mvs_auction
    assert_response :success
  end

  test "should update mvs_auction" do
    put :update, id: @mvs_auction, mvs_auction: { approved: @mvs_auction.approved, auction_end: @mvs_auction.auction_end, ended_at: @mvs_auction.ended_at, item_id: @mvs_auction.item_id, large: @mvs_auction.large, medium: @mvs_auction.medium, mvs_game_id: @mvs_auction.mvs_game_id, price: @mvs_auction.price, small: @mvs_auction.small, title: @mvs_auction.title, url: @mvs_auction.url }
    assert_redirected_to mvs_auction_path(assigns(:mvs_auction))
  end

  test "should destroy mvs_auction" do
    assert_difference('MvsAuction.count', -1) do
      delete :destroy, id: @mvs_auction
    end

    assert_redirected_to mvs_auctions_path
  end
end
