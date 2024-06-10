defmodule Flightex.Users.User do
  alias Flightex.Users.User

  @keys [:name, :email, :cpf, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf) when is_bitstring(cpf) do
    id = UUID.uuid4()

    {:ok,
     %User{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email, _cpf), do: {:error, "Cpf must be a String"}
end
