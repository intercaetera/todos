defmodule Todos.TodolistFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todos.Todolist` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        done: true,
        title: "some title"
      })
      |> Todos.Todolist.create_todo()

    todo
  end
end
