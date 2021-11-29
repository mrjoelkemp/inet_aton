# InetAton

Converts the IP address from the IPv4 numbers-and-dots notation into a "hostlong" in network byte order.

This is an elixir port of an [erlang inet_aton snippet](https://gist.github.com/marcelog/8b5fe7d3aaa83eca2d0f) made available as a package.

## Installation

This package can be installed
by adding `inet_aton` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:inet_aton, "~> 0.2.0"}
  ]
end
```

## Usage

```elixir
require InetAton

ip = "127.0.0.1"

InetAton.convert(ip)  # 2130706433 (hostlong)

InetAton.get_bytes_in_network_byte_order(ip) # <<1, 0, 0, 127>>
```