defmodule Flightex.Users.Agent do
  alias Flightex.Users.User

  use Agent

  def start_link(_initial_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%User{} = user) do
    {Agent.update(__MODULE__, &update_state(&1, user)), user}
  end

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  defp update_state(state, %User{cpf: cpf} = user) do
    Map.put(state, cpf, user)
  end

  defp get_user(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
