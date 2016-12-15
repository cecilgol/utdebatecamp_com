require 'test_helper'

class Admin::NewsPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_news_post = admin_news_posts(:one)
  end

  test "should get index" do
    get admin_news_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_news_post_url
    assert_response :success
  end

  test "should create admin_news_post" do
    assert_difference('Admin::NewsPost.count') do
      post admin_news_posts_url, params: { admin_news_post: {  } }
    end

    assert_redirected_to admin_news_post_url(Admin::NewsPost.last)
  end

  test "should show admin_news_post" do
    get admin_news_post_url(@admin_news_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_news_post_url(@admin_news_post)
    assert_response :success
  end

  test "should update admin_news_post" do
    patch admin_news_post_url(@admin_news_post), params: { admin_news_post: {  } }
    assert_redirected_to admin_news_post_url(@admin_news_post)
  end

  test "should destroy admin_news_post" do
    assert_difference('Admin::NewsPost.count', -1) do
      delete admin_news_post_url(@admin_news_post)
    end

    assert_redirected_to admin_news_posts_url
  end
end
