defmodule InetAton do
  @moduledoc """
  Converts the IP address from the IPv4 numbers-and-dots notation into a "hostlong" in network byte order

  Ported from https://gist.github.com/marcelog/8b5fe7d3aaa83eca2d0f
  """

  @doc """
  iex> InetAton.convert("127.0.0.1")
  2130706433
  """
  @spec convert(binary) :: pos_integer()
  def convert(ip_address) do
    [p1, p2, p3, p4] = String.split(ip_address, ".")
    b1 = Bitwise.bsl(String.to_integer(p1), 24)
    b2 = Bitwise.bsl(String.to_integer(p2), 16)
    b3 = Bitwise.bsl(String.to_integer(p3), 8)
    b4 = String.to_integer(p4)
    b1 + b2 + b3 + b4
  end

  @doc """
  Get the bytes of the given ip address in network byte order

  iex> InetAton.get_bytes_in_network_byte_order("127.0.0.1")
  <<1, 0, 0, 127>>
  """
  @spec get_bytes_in_network_byte_order(binary) :: <<_::32>>
  def get_bytes_in_network_byte_order(ip_address) do
    hostlong = convert(ip_address)

    # This was extracted from htonl taken from https://www.reddit.com/r/elixir/comments/n5oztt/htonsntohs_in_elixir/gx2fwyl/?utm_source=reddit&utm_medium=web2x&context=3
    bytes = <<hostlong::32-unsigned-native>>
    bytes
  end
end
