defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> render_inertia("Home", %{text: "Hello World"})
  end

  def shared(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign_prop(:foo, "bar")
    |> assign_prop(:text, "I should be overriden")
    |> render_inertia("Home", %{text: "Hello World"})
  end

  def lazy(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign_prop(:lazy_1, fn -> "lazy_1" end)
    |> assign_prop(:nested, %{lazy_2: fn -> "lazy_2" end})
    |> render_inertia("Home", %{lazy_3: &lazy_3/0})
  end

  def nested(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign_prop(:a, %{b: %{c: "c", d: "d", e: %{f: "f", g: "g"}}})
    |> render_inertia("Home")
  end

  def always(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign_prop(:a, "a")
    |> assign_prop(:b, "b")
    |> assign_prop(:important, inertia_always("stuff"))
    |> render_inertia("Home")
  end

  def tagged_lazy(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign_prop(:a, inertia_lazy(fn -> "a" end))
    |> assign_prop(:b, "b")
    |> render_inertia("Home")
  end

  def update(conn, _params) do
    conn
    |> redirect(to: "/")
  end

  def patch(conn, _params) do
    conn
    |> redirect(to: "/")
  end

  def delete(conn, _params) do
    conn
    |> redirect(to: "/")
  end

  defp lazy_3 do
    "lazy_3"
  end
end
