require 'test_helper'

class FilmTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film_text = film_texts(:one)
  end

  test "should get index" do
    get film_texts_url, as: :json
    assert_response :success
  end

  test "should create film_text" do
    assert_difference('FilmText.count') do
      post film_texts_url, params: { film_text: { description: @film_text.description, title: @film_text.title } }, as: :json
    end

    assert_response 201
  end

  test "should show film_text" do
    get film_text_url(@film_text), as: :json
    assert_response :success
  end

  test "should update film_text" do
    patch film_text_url(@film_text), params: { film_text: { description: @film_text.description, title: @film_text.title } }, as: :json
    assert_response 200
  end

  test "should destroy film_text" do
    assert_difference('FilmText.count', -1) do
      delete film_text_url(@film_text), as: :json
    end

    assert_response 204
  end
end
