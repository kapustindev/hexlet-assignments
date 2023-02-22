# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a post' do
    visit posts_path
    click_on 'New Post'

    fill_in "Title", with: @post.title
    fill_in "Body", with: @post.body
    click_on 'Create Post'

    assert_text 'Post was successfully created'
  end

  test 'updating a post' do
    visit posts_path
    click_on 'Edit', match: :first

    fill_in "Title", with: 'New Title'
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
  end

  test 'destroying a post' do
    visit posts_path
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end

  test 'creating a comment' do
    visit posts_path
    click_on 'Show', match: :first

    fill_in 'post_comment_body', with: 'New Comment'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
  end
end
# END
