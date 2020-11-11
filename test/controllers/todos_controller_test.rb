require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { completed: @todo.completed, title: @todo.title } }
    end

    assert_redirected_to root_url
  end

  test "should redirect todo to root" do
    get todo_url(@todo)
    assert_redirected_to root_url
  end

  test "should show JSON todo" do
    get todo_url(@todo, format: :json)
    assert_response :success
    assert_equal 'application/json; charset=utf-8', response.content_type
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { completed: @todo.completed, title: @todo.title } }
    assert_redirected_to root_url
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to root_url
  end
end
