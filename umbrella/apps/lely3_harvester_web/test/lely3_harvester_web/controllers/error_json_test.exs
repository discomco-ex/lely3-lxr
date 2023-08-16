defmodule Lely3HarvesterWeb.ErrorJSONTest do
  use Lely3HarvesterWeb.ConnCase, async: true

  test "renders 404" do
    assert Lely3HarvesterWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Lely3HarvesterWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
