defmodule Todos.TodolistTest do
  use Todos.DataCase

  alias Todos.Todolist

  describe "todos" do
    alias Todos.Todolist.Todo

    import Todos.TodolistFixtures

    @invalid_attrs %{done: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Todolist.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todolist.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{done: true, title: "some title"}

      assert {:ok, %Todo{} = todo} = Todolist.create_todo(valid_attrs)
      assert todo.done == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todolist.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{done: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Todolist.update_todo(todo, update_attrs)
      assert todo.done == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todolist.update_todo(todo, @invalid_attrs)
      assert todo == Todolist.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todolist.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todolist.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todolist.change_todo(todo)
    end
  end
end
