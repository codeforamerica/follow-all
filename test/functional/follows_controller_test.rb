require 'test_helper'

class FollowsControllerTest < ActionController::TestCase
  test 'should follow all users on a list' do
    session[:access_token] = 'abc'
    session[:access_token_secret] = '123'
    stub_request(:get, 'https://api.twitter.com/1.1/account/verify_credentials.json').
      with(query: {skip_status: 'true'}).
      to_return(body: File.read(File.expand_path('../../fixtures/user.json', __FILE__)))
    stub_request(:get, 'https://api.twitter.com/1.1/users/show.json').
      with(query: {screen_name: 'sferik'}).
      to_return(body: File.read(File.expand_path('../../fixtures/user.json', __FILE__)))
    stub_request(:get, 'https://api.twitter.com/1.1/lists/members.json').
      with(query: {cursor: '-1', owner_screen_name: 'codeforamerica', slug: 'team', skip_status: 'true', include_entities: 'false'}).
      to_return(body: File.read(File.expand_path('../../fixtures/members.json', __FILE__)))
    stub_request(:get, 'https://api.twitter.com/1.1/friends/ids.json').
      with(query: {cursor: '-1', user_id: '7505382'}).
      to_return(body: File.read(File.expand_path('../../fixtures/friend_ids.json', __FILE__)))
    stub_request(:post, 'https://api.twitter.com/1.1/users/lookup.json').
      with(body: {user_id: '30794335,200019112,15335145,12513,15784319,2384071,15101375,14239131,74543,15209501,15866539,23828637,16222728,211580914,51764038,21076132,21866144,23242128,823408,15978771'}).
      to_return(body: File.read(File.expand_path('../../fixtures/users.json', __FILE__)))
    stub_request(:post, 'https://api.twitter.com/1.1/friendships/create.json').
      to_return(body: File.read(File.expand_path('../../fixtures/user.json', __FILE__)))
    stub_request(:get, 'https://api.twitter.com/1.1/account/verify_credentials.json').
      to_return(body: File.read(File.expand_path('../../fixtures/user.json', __FILE__)))
    post :create, list: 'codeforamerica/team'
    assert_not_nil assigns :user
    assert_not_nil assigns :new_friends
    assert_equal 'You are now following 20 new people.', flash[:notice]
    assert_response :success
    assert_select 'title', 'Follow All'
    assert_select 'ul.thumbnails li', count: 20
    assert_select 'form' do
      assert_select '[action=?]', '/follows'
      assert_select '[method=?]', 'post'
    end
    assert_select 'select[name="list"]' do
      assert_select '[value=?]', 'codeforamerica/team'
    end
    assert_select 'button', 'Follow all members of this list!'
  end

  test 'should redirect to failure path when unauthenticated' do
    post :create, list: 'codeforamerica/team'
    assert_redirected_to failure_path
  end
end
