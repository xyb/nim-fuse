import filesystem
import channel
import request
import kernel

type Session[FS:Filesystem] = ref object 
  fs: FS
  chan: Channel
  proto_major: uint32
  proto_minor: uint32
  initialized: bool
  destroyed: bool

proc mkSession[FS:Filesystem](fs:FS, chan: Channel): Session =
  Session (
    fs: fs,
    chan: chan,
    initialized: false,
    destroyed: false,
  )

proc exists(self: Session): bool =
  not self.destroyed

proc handle(self: Session, buf: Buf): Request =
  mkRequest(self.chan.mkSender, buf)

proc loop(self: Session) =
  var buf = mkBuf(RECOMMENDED_BUFSIZE)
  while self.exists:
    let err = self.chan.fetch(buf)
    if err:
      # TODO
    else:
      # Now the buffer is valid
      self.handle(buf)

proc mkMain(fstype: typedesc[Filesystem], mountpoint: string, options) =
  let fs = fstype()
  let chan = connect(mountpoint, options)
  let se = mkSession(fs, chan)
  se.loop
  disconnect(chan)
