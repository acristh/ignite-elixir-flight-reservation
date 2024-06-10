defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  use Agent

  def call(%{name: name, email: email, cpf: cpf}) when is_bitstring(cpf) do
    {:ok, user} = User.build(name, email, cpf)
    UserAgent.save(user)
  end

  def call(%{name: _name, email: _email, cpf: _cpf}), do: {:error, "Cpf must be a String"}
end
