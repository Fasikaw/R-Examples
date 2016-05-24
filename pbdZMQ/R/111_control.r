#' Sets of controls in pbdZMQ.
#' 
#' These sets of controls are used to provide default values in this package.
#' 
#' @param warning.at.error,stop.at.error
#' Logical; if there is a messaging error, should there be an
#' R warning/error.
#' @param POLLIN,POLLOUT,POLLERR
#' ZMQ poll options; see zmq.h for details.
#' @param BLOCK,DONTWAIT,NOBLOCK,SNDMORE
#' ZMQ socket options; see zmq.h for details.
#' @param AFFINITY,IDENTITY,SUBSCRIBE,UNSUBSCRIBE,RATE,RECOVERY_IVL,SNDBUF,RCVBUF,RCVMORE,FD,EVENTS,TYPE,LINGER,RECONNECT_IVL,BACKLOG,RECONNECT_IVL_MAX,MAXMSGSIZE,SNDHWM,RCVHWM,MULTICAST_HOPS,RCVTIMEO,SNDTIMEO,LAST_ENDPOINT,ROUTER_MANDATORY,TCP_KEEPALIVE,TCP_KEEPALIVE_CNT,TCP_KEEPALIVE_IDLE,TCP_KEEPALIVE_INTVL,TCP_ACCEPT_FILTER,IMMEDIATE,XPUB_VERBOSE,ROUTER_RAW,IPV6,MECHANISM,PLAIN_SERVER,PLAIN_USERNAME,PLAIN_PASSWORD,CURVE_SERVER,CURVE_PUBLICKEY,CURVE_SECRETKEY,CURVE_SERVERKEY,PROBE_ROUTER,REQ_CORRELATE,REQ_RELAXED,CONFLATE,ZAP_DOMAIN,ROUTER_HANDOVER,TOS,IPC_FILTER_PID,IPC_FILTER_UID,IPC_FILTER_GID,CONNECT_RID,GSSAPI_SERVER,GSSAPI_PRINCIPAL,GSSAPI_SERVICE_PRINCIPAL,GSSAPI_PLAINTEXT,HANDSHAKE_IVL,IDENTITY_FD,SOCKS_PROXY,XPUB_NODROP
#' ZMQ socket options; see zmq.h for details.
#' @param PAIR,PUB,SUB,REQ,REP,DEALER,ROUTER,PULL,PUSH,XPUB,XSUB,STREAM
#' ZMQ socket types; see zmq.h for details.
#' 
#' @author Wei-Chen Chen \email{wccsnow@@gmail.com}.
#' 
#' @references ZeroMQ/4.1.0 API Reference:
#' \url{http://api.zeromq.org/4-1:_start}
#' 
#' Programming with Big Data in R Website: \url{http://r-pbd.org/}
#' 
#' @keywords global variables
#' @seealso \code{\link{.pbd_env}}.
#' @name ZMQ Control Functions
#' @rdname zz_zmq_control
NULL



### For ZMQ message control.
#' @export
#' @rdname zz_zmq_control
ZMQ.MC <- function(
  warning.at.error = TRUE,
  stop.at.error = FALSE
){
  list(
    warning.at.error = warning.at.error,
    stop.at.error = stop.at.error
  )
}



### For ZMQ polll (I/O multiplexing).
#' @export
#' @rdname zz_zmq_control
ZMQ.PO <- function(
  POLLIN = 1L,
  POLLOUT = 2L,
  POLLERR = 4L# ,
  # POLLITEMS_DFLT = 16L
){
  list(
    POLLIN = POLLIN,
    POLLOUT = POLLOUT,
    POLLERR = POLLERR# ,
    # POLLITEMS_DFLT = POLLITEMS_DFLT
  )
}



### For ZMQ send/recv options, see zmq.h for details.
#' @export
#' @rdname zz_zmq_control
ZMQ.SR <- function(
  BLOCK = 0L,
  DONTWAIT = 1L,
  NOBLOCK = 1L,
  SNDMORE = 2L
){
  list(
    BLOCK = BLOCK,
    DONTWAIT = DONTWAIT,
    NOBLOCK = NOBLOCK,
    SNDMORE = SNDMORE
  )
}



### For ZMQ socket options, see zmq.h for details.
#' @export
#' @rdname zz_zmq_control
ZMQ.SO <- function(
  AFFINITY = 4L,
  IDENTITY = 5L,
  SUBSCRIBE = 6L,
  UNSUBSCRIBE = 7L,
  RATE = 8L,
  RECOVERY_IVL = 9L,
  SNDBUF = 11L,
  RCVBUF = 12L,
  RCVMORE = 13L,
  FD = 14L,
  EVENTS = 15L,
  TYPE = 16L,
  LINGER = 17L,
  RECONNECT_IVL = 18L,
  BACKLOG = 19L,
  RECONNECT_IVL_MAX = 21L,
  MAXMSGSIZE = 22L,
  SNDHWM = 23L,
  RCVHWM = 24L,
  MULTICAST_HOPS = 25L,
  RCVTIMEO = 27L,
  SNDTIMEO = 28L,
  LAST_ENDPOINT = 32L,
  ROUTER_MANDATORY = 33L,
  TCP_KEEPALIVE = 34L,
  TCP_KEEPALIVE_CNT = 35L,
  TCP_KEEPALIVE_IDLE = 36L,
  TCP_KEEPALIVE_INTVL = 37L,
  TCP_ACCEPT_FILTER = 38L,
  IMMEDIATE = 39L,
  XPUB_VERBOSE = 40L,
  ROUTER_RAW = 41L,
  IPV6 = 42L,
  MECHANISM = 43L,
  PLAIN_SERVER = 44L,
  PLAIN_USERNAME = 45L,
  PLAIN_PASSWORD = 46L,
  CURVE_SERVER = 47L,
  CURVE_PUBLICKEY = 48L,
  CURVE_SECRETKEY = 49L,
  CURVE_SERVERKEY = 50L,
  PROBE_ROUTER = 51L,
  REQ_CORRELATE = 52L,
  REQ_RELAXED = 53L,
  CONFLATE = 54L,
  ZAP_DOMAIN = 55L,
  ROUTER_HANDOVER = 56L,
  TOS = 57L,
  IPC_FILTER_PID = 58L,
  IPC_FILTER_UID = 59L,
  IPC_FILTER_GID = 60L,
  CONNECT_RID = 61L,
  GSSAPI_SERVER = 62L,
  GSSAPI_PRINCIPAL = 63L,
  GSSAPI_SERVICE_PRINCIPAL = 64L,
  GSSAPI_PLAINTEXT = 65L,
  HANDSHAKE_IVL = 66L,
  IDENTITY_FD = 67L,
  SOCKS_PROXY = 68L,
  XPUB_NODROP = 69L
){
  list(
    AFFINITY = AFFINITY,
    IDENTITY = IDENTITY,
    SUBSCRIBE = SUBSCRIBE,
    UNSUBSCRIBE = UNSUBSCRIBE,
    RATE = RATE,
    RECOVERY_IVL = RECOVERY_IVL,
    SNDBUF = SNDBUF,
    RCVBUF = RCVBUF,
    RCVMORE = RCVMORE,
    FD = FD,
    EVENTS = EVENTS,
    TYPE = TYPE,
    LINGER = LINGER,
    RECONNECT_IVL = RECONNECT_IVL,
    BACKLOG = BACKLOG,
    RECONNECT_IVL_MAX = RECONNECT_IVL_MAX,
    MAXMSGSIZE = MAXMSGSIZE,
    SNDHWM = SNDHWM,
    RCVHWM = RCVHWM,
    MULTICAST_HOPS = MULTICAST_HOPS,
    RCVTIMEO = RCVTIMEO,
    SNDTIMEO = SNDTIMEO,
    LAST_ENDPOINT = LAST_ENDPOINT,
    ROUTER_MANDATORY = ROUTER_MANDATORY,
    TCP_KEEPALIVE = TCP_KEEPALIVE,
    TCP_KEEPALIVE_CNT = TCP_KEEPALIVE_CNT,
    TCP_KEEPALIVE_IDLE = TCP_KEEPALIVE_IDLE,
    TCP_KEEPALIVE_INTVL = TCP_KEEPALIVE_INTVL,
    TCP_ACCEPT_FILTER = TCP_ACCEPT_FILTER,
    IMMEDIATE = IMMEDIATE,
    XPUB_VERBOSE = XPUB_VERBOSE,
    ROUTER_RAW = ROUTER_RAW,
    IPV6 = IPV6,
    MECHANISM = MECHANISM,
    PLAIN_SERVER = PLAIN_SERVER,
    PLAIN_USERNAME = PLAIN_USERNAME,
    PLAIN_PASSWORD = PLAIN_PASSWORD,
    CURVE_SERVER = CURVE_SERVER,
    CURVE_PUBLICKEY = CURVE_PUBLICKEY,
    CURVE_SECRETKEY = CURVE_SECRETKEY,
    CURVE_SERVERKEY = CURVE_SERVERKEY,
    PROBE_ROUTER = PROBE_ROUTER,
    REQ_CORRELATE = REQ_CORRELATE,
    REQ_RELAXED = REQ_RELAXED,
    CONFLATE = CONFLATE,
    ZAP_DOMAIN = ZAP_DOMAIN,
    ROUTER_HANDOVER = ROUTER_HANDOVER,
    TOS = TOS,
    IPC_FILTER_PID = IPC_FILTER_PID,
    IPC_FILTER_UID = IPC_FILTER_UID,
    IPC_FILTER_GID = IPC_FILTER_GID,
    CONNECT_RID = CONNECT_RID,
    GSSAPI_SERVER = GSSAPI_SERVER,
    GSSAPI_PRINCIPAL = GSSAPI_PRINCIPAL,
    GSSAPI_SERVICE_PRINCIPAL = GSSAPI_SERVICE_PRINCIPAL,
    GSSAPI_PLAINTEXT = GSSAPI_PLAINTEXT,
    HANDSHAKE_IVL = HANDSHAKE_IVL,
    IDENTITY_FD = IDENTITY_FD,
    SOCKS_PROXY = SOCKS_PROXY,
    XPUB_NODROP = XPUB_NODROP
  )
}



### For ZMQ socket types, see zmq.h for details.
#' @export
#' @rdname zz_zmq_control
ZMQ.ST <- function(
  PAIR = 0L,
  PUB = 1L,
  SUB = 2L,
  REQ = 3L,
  REP = 4L,
  DEALER = 5L,
  ROUTER = 6L,
  PULL = 7L,
  PUSH = 8L,
  XPUB = 9L,
  XSUB = 10L,
  STREAM = 11L
){
  list(
    PAIR = PAIR,
    PUB = PUB,
    SUB = SUB,
    REQ = REQ,
    REP = REP,
    DEALER = DEALER,
    ROUTER = ROUTER,
    PULL = PULL,
    PUSH = PUSH,
    XPUB = XPUB,
    XSUB = XSUB,
    STREAM = STREAM
  )
}