import gleam/bytes_tree.{type BytesTree}
import gleam/erlang/charlist.{type Charlist}
import gleam/erlang/process.{type Pid}
import stratus/internal/socket.{
  type Shutdown, type Socket, type SocketReason, type TcpOption,
}

@external(erlang, "gen_tcp", "connect")
pub fn connect(
  address: Charlist,
  port: Int,
  options: List(TcpOption),
  timeout: Int,
) -> Result(Socket, SocketReason)

@external(erlang, "stratus_ffi", "tcp_shutdown")
pub fn shutdown(socket: Socket, how: Shutdown) -> Result(Nil, SocketReason)

@external(erlang, "stratus_ffi", "tcp_send")
pub fn send(socket: Socket, packet: BytesTree) -> Result(Nil, SocketReason)

@external(erlang, "gen_tcp", "recv")
pub fn receive(socket: Socket, length: Int) -> Result(BitArray, SocketReason)

@external(erlang, "gen_tcp", "recv")
pub fn receive_timeout(
  socket: Socket,
  length: Int,
  timeout: Int,
) -> Result(BitArray, SocketReason)

@external(erlang, "stratus_ffi", "tcp_set_opts")
pub fn set_opts(
  socket: Socket,
  opts: List(TcpOption),
) -> Result(Nil, SocketReason)

@external(erlang, "stratus_ffi", "tcp_controlling_process")
pub fn controlling_process(
  socket: Socket,
  new_owner: Pid,
) -> Result(Nil, SocketReason)
